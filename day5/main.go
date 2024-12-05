package main

import (
	"bufio"
	"fmt"
	"os"
	"slices"
	"strconv"
	"strings"
)

func main() {
	f, err := os.Open("test_input.txt")
	if err != nil {
		fmt.Println("No file")
		return
	}

	defer f.Close()

	scanner := bufio.NewScanner(f)
	rules := map[string][]string{}
	updates := [][]string{}

	for scanner.Scan() {
		line := scanner.Text()
		if strings.Contains(line, "|") {
			values := strings.Split(line, "|")
			rules[values[0]] = append(rules[values[0]], values[1])
		} else {
			updates = append(updates, strings.Split(line, ","))
		}
	}

	count := 0
	count_p2 := 0
	for _, update := range updates {
		valid := true
		for i := 0; i < len(update); i++ {
			number := update[i]
			for _, rule := range rules[number] {
				previous_numbers := update[:i]
				index := slices.Index(previous_numbers, rule)
				if index != -1 {
					update = slices.Delete(update, index, index+1)
					update = slices.Insert(update, i, rule)
					valid = false
					i = 0
					break
				}
			}
		}
		val, _ := strconv.Atoi(update[len(update)/2])

		if valid {
			count = count + val
		} else {
			count_p2 = count_p2 + val
		}

	}
	fmt.Println(count_p2)
}
