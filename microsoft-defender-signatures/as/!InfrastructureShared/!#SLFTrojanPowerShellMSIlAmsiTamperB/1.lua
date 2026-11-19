-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:PowerShell/MSIlAmsiTamper.B
-- Type: 10
-- Includes: TechniqueTracker
-- MpAttributes: Lua:CloudBlockLevelGT3 & Lua:IsDotNetAMSIScan & (HSTR:DotNet/AmsiTampering.B | SLF:Trojan:PowerShell/MSILAmsiTamper.C | SLF:Trojan:PowerShell/MSILAmsiTamper.D)

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_0:find("powershell", 1, true) then
  local l_0_1 = pe.get_versioninfo()
  if l_0_1 ~= nil and l_0_1.OriginalFilename ~= nil then
    local l_0_2 = string.lower(l_0_1.OriginalFilename)
    if l_0_2:find("powerleech.dll", 1, true) or l_0_2:find("ddcpowershellhelper.dll", 1, true) or l_0_2:find("cylance.dotnethookhelper.dll", 1, true) then
      return mp.CLEAN
    end
  end
  TrackPidAndTechnique("AMSI", "T1562.001", "amsitampering")
  return mp.INFECTED
end
return mp.CLEAN
