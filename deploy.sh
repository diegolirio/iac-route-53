
StackName=$(jq '.Parameters.StackName'          ./parameters/parameters.json | sed -e 's/"//g')
DomainMainName=$(jq '.Parameters.DomainMainName'     ./parameters/parameters.json | sed -e 's/"//g')
DevelopSubdomain=$(jq '.Parameters.DevelopSubdomain'   ./parameters/parameters.json | sed -e 's/"//g')
HostedZoneIdCustom=$(jq '.Parameters.HostedZoneIdCustom' ./parameters/parameters.json | sed -e 's/"//g')

echo "StackName =====> $StackName"
echo "DomainMainName =====> $DomainMainName"
echo "DevelopSubdomain =======> $DevelopSubdomain"
echo "HostedZoneIdCustom ========> $HostedZoneIdCustom"

aws cloudformation deploy --template-file template.yml --stack-name $StackName --parameter-overrides DomainMainName=$DomainMainName DevelopSubdomain=$DevelopSubdomain HostedZoneIdCustom=$HostedZoneIdCustom --tags Name=LirioTech 