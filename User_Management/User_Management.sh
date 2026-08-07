#!/bin/bash

LOGFILE="user_management.log"

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

while true
do
    clear
    echo "=========================================="
    echo "       LINUX USER MANAGEMENT SYSTEM"
    echo "=========================================="
    echo "1. Create User"
    echo "2. Delete User"
    echo "3. Modify Username"
    echo "4. Change Password"
    echo "5. Lock User"
    echo "6. Unlock User"
    echo "7. List Users"
    echo "8. User Information"
    echo "9. Create Group"
    echo "10. Delete Group"
    echo "11. Add User to Group"
    echo "12. Remove User from Group"
    echo "13. Exit"
    echo "=========================================="

    read -p "Enter your choice: " choice

    case $choice in

    1)
        read -p "Enter username: " username

        if id "$username" &>/dev/null
        then
            echo "User already exists."
        else
            useradd "$username"

            if [ $? -eq 0 ]
            then
                passwd "$username"
                echo "$(date): User '$username' created." >> "$LOGFILE"
                echo "User created successfully."
            else
                echo "Failed to create user."
            fi
        fi
        ;;

    2)
        read -p "Enter username to delete: " username

        if id "$username" &>/dev/null
        then
            read -p "Are you sure? (y/n): " ans

            if [ "$ans" = "y" ]
            then
                userdel -r "$username"

                if [ $? -eq 0 ]
                then
                    echo "$(date): User '$username' deleted." >> "$LOGFILE"
                    echo "User deleted successfully."
                else
                    echo "Deletion failed."
                fi
            else
                echo "Deletion cancelled."
            fi
        else
            echo "User does not exist."
        fi
        ;;

    3)
        read -p "Current username: " olduser

        if id "$olduser" &>/dev/null
        then
            read -p "New username: " newuser

            usermod -l "$newuser" "$olduser"

            if [ $? -eq 0 ]
            then
                echo "$(date): User '$olduser' renamed to '$newuser'." >> "$LOGFILE"
                echo "Username modified successfully."
            else
                echo "Modification failed."
            fi
        else
            echo "User does not exist."
        fi
        ;;

    4)
        read -p "Enter username: " username

        if id "$username" &>/dev/null
        then
            passwd "$username"
            echo "$(date): Password changed for '$username'." >> "$LOGFILE"
        else
            echo "User does not exist."
        fi
        ;;

    5)
        read -p "Enter username: " username

        if id "$username" &>/dev/null
        then
            usermod -L "$username"
            echo "$(date): User '$username' locked." >> "$LOGFILE"
            echo "User locked successfully."
        else
            echo "User does not exist."
        fi
        ;;

    6)
        read -p "Enter username: " username

        if id "$username" &>/dev/null
        then
            usermod -U "$username"
            echo "$(date): User '$username' unlocked." >> "$LOGFILE"
            echo "User unlocked successfully."
        else
            echo "User does not exist."
        fi
        ;;

    7)
        echo
        echo "Normal Users:"
        awk -F: '$3>=1000 {print $1}' /etc/passwd
        ;;

    8)
        read -p "Enter username: " username

        if id "$username" &>/dev/null
        then
            id "$username"
        else
            echo "User does not exist."
        fi
        ;;

    9)
        read -p "Enter group name: " group

        if getent group "$group" >/dev/null
        then
            echo "Group already exists."
        else
            groupadd "$group"

            if [ $? -eq 0 ]
            then
                echo "$(date): Group '$group' created." >> "$LOGFILE"
                echo "Group created successfully."
            fi
        fi
        ;;

    10)
        read -p "Enter group name: " group

        if getent group "$group" >/dev/null
        then
            groupdel "$group"

            if [ $? -eq 0 ]
            then
                echo "$(date): Group '$group' deleted." >> "$LOGFILE"
                echo "Group deleted successfully."
            fi
        else
            echo "Group does not exist."
        fi
        ;;

    11)
        read -p "Enter username: " username
        read -p "Enter group name: " group

        if id "$username" &>/dev/null && getent group "$group" >/dev/null
        then
            usermod -aG "$group" "$username"

            if [ $? -eq 0 ]
            then
                echo "$(date): Added '$username' to '$group'." >> "$LOGFILE"
                echo "User added to group successfully."
            fi
        else
            echo "User or group does not exist."
        fi
        ;;

    12)
        read -p "Enter username: " username
        read -p "Enter group name: " group

        if id "$username" &>/dev/null && getent group "$group" >/dev/null
        then
            gpasswd -d "$username" "$group"

            if [ $? -eq 0 ]
            then
                echo "$(date): Removed '$username' from '$group'." >> "$LOGFILE"
                echo "User removed from group successfully."
            fi
        else
            echo "User or group does not exist."
        fi
        ;;

    13)
        echo "Thank you for using User Management System."
        exit
        ;;

    *)
        echo "Invalid choice."
        ;;

    esac

    echo
    read -p "Press Enter to continue..."
done