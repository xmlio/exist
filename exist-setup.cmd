spawn java -jar eXist-db-setup-latest.jar -console
expect "Select target" { send "/opt/exist\n" }
expect "press 1" { send "1\n" }
expect "Data dir" { send "/data/exist\n" }
expect "press 1" { send "1\n" }
expect "Enter password" { send "exist\n" }
expect "Enter password" { send "exist\n" }
expect "Maximum memory" { send "\n" }
expect "Cache memory" { send "\n" }
expect "press 1" {
    send "1\n"
}
expect -timeout -1 "Console installation done" {
    wait
    exit
}

