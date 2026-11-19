-- Threat: !InfrastructureShared
-- Name: !#TELPER:LUA:Trojan:Python/Obfuscator.A.gen!lowfi
-- Type: 13

if mp.get_mpattribute("SCRIPT:PythonImportBase64") and mp.get_mpattribute("SCRIPT:PythonImportZlib") and mp.get_mpattributesubstring("PACKED_WITH:[PyInsObj]") then
  return mp.INFECTED
end
return mp.CLEAN
