#!/usr/bin/env bash

# Test plugin for ng-certificate-manager

echo -e "Test plugin called! Dumping parameters:\n"

echo "Certificate Name:"
echo "-> \"${_CERT_NAME}\""
echo

echo "The Certificate fullchain is at:"
echo "-> ${_CERT_FULLCHAIN}"
echo

echo "The Certificate Private Key is at:"
echo "-> ${_CERT_KEY}"
echo

echo "End of test plugin"