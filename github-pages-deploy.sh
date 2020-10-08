#!/bin/bash
# DApp Deployment Script
echo -ne "==> Deploy DApp"

if [[ d public ]]; 
then rm rf public/; 
fi


if [[ ! d public ]]; 
then mkdir public;
fi

cp build/app.js public/ && cp build/index.html public/
