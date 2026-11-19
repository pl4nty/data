-- Threat: !InfrastructureShared
-- Name: !#ALF:Ransom:Win32/Exxroute!downloadName
-- Type: 9

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if (l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE) and peattributes.isdll then
  local l_0_1 = mp.getfilesize()
  if 17664 < l_0_1 and l_0_1 < 1200128 then
    local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
    if string.find(l_0_2, "api%-ms%-win%-system%-%w+%-l1%-1%-0%.dll") then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
