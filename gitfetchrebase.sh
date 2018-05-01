#!/bin/bash

git fetch origin ${1:-develop} && git rebase FETCH_HEAD
