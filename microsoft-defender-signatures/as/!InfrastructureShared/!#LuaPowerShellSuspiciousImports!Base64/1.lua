-- Threat: !InfrastructureShared
-- Name: !#Lua:PowerShell/SuspiciousImports!Base64
-- Type: 13
-- MpAttributes: ALF:PowerShell_SuspiciousImports

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "%->%(base64%)%->%(utf%-16le%)") then
  return mp.INFECTED
end
return mp.CLEAN
