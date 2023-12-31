#!/bin/bash

function one_line_pem {
    echo "`awk 'NF {sub(/\\n/, ""); printf "%s\\\\\\\n",$0;}' $1`"
}

function json_ccp {
    local PP=$(one_line_pem $4)
    local CP=$(one_line_pem $5)
    sed -e "s/\${ORG}/$1/" \
        -e "s/\${P2PORT}/$7/" \
        -e "s/\${P3PORT}/$8/" \
        -e "s/\${CAPORT}/$3/" \
        -e "s#\${PEERPEM}#$PP#" \
        -e "s#\${CAPEM}#$CP#" \
        organizations/ccp-template.json
}

function yaml_ccp {
    local PP=$(one_line_pem $4)
    local CP=$(one_line_pem $5)
    sed -e "s/\${ORG}/$1/" \
        -e "s/\${P2PORT}/$7/" \
        -e "s/\${P3PORT}/$8/" \
        -e "s/\${CAPORT}/$3/" \
        -e "s#\${PEERPEM}#$PP#" \
        -e "s#\${CAPEM}#$CP#" \
        organizations/ccp-template.yaml | sed -e $'s/\\\\n/\\\n          /g'
}

ORG=1
P2PORT=9051
P3PORT=10051
CAPORT=7065
PEERPEM=organizations/peerOrganizations/org1.example.com/tlsca/tlsca.org1.example.com-cert.pem
CAPEM=organizations/peerOrganizations/org1.example.com/ca/ca.org1.example.com-cert.pem

echo "$(json_ccp $ORG $P2PORT $CAPORT $PEERPEM $CAPEM $P3PORT)" > organizations/peerOrganizations/org1.example.com/connection-org1.json
echo "$(yaml_ccp $ORG $P2PORT $CAPORT $PEERPEM $CAPEM $P3PORT)" > organizations/peerOrganizations/org1.example.com/connection-org1.yaml

ORG=2
P2PORT=9053
P3PORT=10053
CAPORT=8065
PEERPEM=organizations/peerOrganizations/org2.example.com/tlsca/tlsca.org2.example.com-cert.pem
CAPEM=organizations/peerOrganizations/org2.example.com/ca/ca.org2.example.com-cert.pem

echo "$(json_ccp $ORG $P2PORT $CAPORT $PEERPEM $CAPEM $P3PORT)" > organizations/peerOrganizations/org2.example.com/connection-org2.json
echo "$(yaml_ccp $ORG $P2PORT $CAPORT $PEERPEM $CAPEM $P3PORT)" > organizations/peerOrganizations/org2.example.com/connection-org2.yaml

ORG=3
P2PORT=9055
P3PORT=10055
CAPORT=9065
PEERPEM=organizations/peerOrganizations/org3.example.com/tlsca/tlsca.org3.example.com-cert.pem
CAPEM=organizations/peerOrganizations/org3.example.com/ca/ca.org3.example.com-cert.pem

echo "$(json_ccp $ORG $P2PORT $CAPORT $PEERPEM $CAPEM $P3PORT)" > organizations/peerOrganizations/org3.example.com/connection-org3.json
echo "$(yaml_ccp $ORG $P2PORT $CAPORT $PEERPEM $CAPEM $P3PORT)" > organizations/peerOrganizations/org3.example.com/connection-org3.yaml

ORG=4
P2PORT=9057
P3PORT=10057
CAPORT=10065
PEERPEM=organizations/peerOrganizations/org4.example.com/tlsca/tlsca.org4.example.com-cert.pem
CAPEM=organizations/peerOrganizations/org4.example.com/ca/ca.org4.example.com-cert.pem

echo "$(json_ccp $ORG $P2PORT $CAPORT $PEERPEM $CAPEM $P3PORT)" > organizations/peerOrganizations/org4.example.com/connection-org4.json
echo "$(yaml_ccp $ORG $P2PORT $CAPORT $PEERPEM $CAPEM $P3PORT)" > organizations/peerOrganizations/org4.example.com/connection-org4.yaml