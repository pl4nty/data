-- Threat: !InfrastructureShared
-- Name: a8f5898e-1dc8-49a9-9878-85004b8a61e6
-- Type: 25

function GetRuleInfo()
  return {
    Name = "Block Webshell creation for Servers",
    
    Description = "Windows Defender Exploit Guard detected Webshell creation"
  }
end
