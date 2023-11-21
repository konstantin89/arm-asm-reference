#!/bin/bash

as -g -o app.o app.s
ld -o app  app.o