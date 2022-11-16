#!/usr/bin/env bash

# Test plugin for ng-certificate-manager

echo -e "Test plugin called! Dumping parameters:\n"

echo "Certificate Name:"
echo "-> \"$1\""
echo

echo "The Certificate fullchain is at:"
echo "-> $2"
echo

echo "The Certificate Private Key is at:"
echo "-> $3"
echo

echo "End of test plugin"