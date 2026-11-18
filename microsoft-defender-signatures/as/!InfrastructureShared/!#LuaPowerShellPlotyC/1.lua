-- Threat: !InfrastructureShared
-- Name: !#Lua:PowerShell/Ploty.C
-- Type: 13

if mp.get_mpattribute("SCRIPT:PowerShell/Ploty.C!head") then
  local l_0_0 = string.lower(mp.getfilename())
  if string.find(l_0_0, "%->%[powershellb64%]%->%(base64%)") then
    return mp.INFECTED
  end
end
return mp.CLEAN
