-- Threat: !InfrastructureShared
-- Name: !#SLF:HighRiskHasMotW
-- Type: 10
-- MpAttributes: RPF:TopLevelFile & LUA:FileSizeLE100M.B

function is_signed()
  local l_1_0 = mp.GetCertificateInfo()
  
  for l_1_1, l_1_2 in pairs(l_1_0) do
    if l_1_2.Signers ~= nil then
      return true
    end
  end
  return false
end

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
  if l_0_1 ~= "uTorrent.exe" and is_signed() == false then
    return mp.INFECTED
  end
end
return mp.CLEAN
