package main

import (
	"fmt"

	"github.com/zhs007/jarvisnote/basedef"
)

func main() {
	fmt.Print("jarvis note start...\n")
	fmt.Print("jarvis note version is " + basedef.VERSION + "\n")

	// cfg, err := viewer.LoadConfig("cfg/config.yaml")
	// if err != nil {
	// 	fmt.Print("load config.yaml fail!")

	// 	return
	// }

	// jv, err := viewer.NewViewer(cfg)
	// if err != nil {
	// 	fmt.Print(err.Error())

	// 	return
	// }

	// jv.Start(context.Background())

	fmt.Print("jarvis note end.\n")
}
