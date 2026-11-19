-- Threat: !InfrastructureShared
-- Name: !#Trojan:JS/Flafisi.C.1
-- Type: 13

if mp.get_mpattribute("PowerShell:DownloadFile!Lowfi") or mp.get_mpattribute("SCPT:JS/PowerShell.DownloadFile.A") or mp.get_mpattribute("SCPT:PowerShell/DownloadString") then
  local l_0_0 = string.lower(mp.getfilename())
  if string.find(l_0_0, "%.hta$") ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
