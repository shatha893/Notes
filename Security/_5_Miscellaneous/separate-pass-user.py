
usernames= []
passwords = []
with open("use-pass.txt", "r") as a_file:
  for line in a_file:
    stripped_line = line.strip()
    use_pass = stripped_line.split(":")
    usernames.append(use_pass[0])
    passwords.append(use_pass[1])

with open("usernames.txt", "a") as user:
  for username in usernames:
    user.write(username+"\n")

with open("passwords.txt", "a") as passs:
  for password in passwords:
    passs.write(password+"\n")


with open("passwords.txt", "r") as a_file:
  for line in a_file:
    stripped_line = line.strip()
    print(stripped_line)