package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"path/filepath"
	"syscall"
	"time"
)

func main() {
	files := getFiles(".")
	for _, file := range files {
		var s syscall.Stat_t
		syscall.Stat(file, &s)
		sec := s.Atimespec.Sec
		loc, err := time.LoadLocation("Asia/Tokyo")
		if err != nil {
			loc = time.FixedZone("Asia/Tokyo", 9*60*60)
		}
		at := time.Date(2018, 7, 13, 18, 7, 0, 0, loc)
		if at.Before(time.Unix(sec, 0)) {
			fmt.Println(fmt.Sprint(file, " : ", time.Unix(sec, 0)))
		}
	}
}

func getFiles(dir string) []string {
	files, err := ioutil.ReadDir(dir)
	if err != nil {
		log.Fatal(err)
	}

	var paths []string
	for _, file := range files {
		if file.IsDir() {
			paths = append(paths, getFiles(filepath.Join(dir, file.Name()))...)
			continue
		}
		paths = append(paths, filepath.Join(dir, file.Name()))
	}
	return paths
}
