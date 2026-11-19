-- Threat: !InfrastructureShared
-- Name: !#TEL:Trojan:Win32/Gatak.EG!dha
-- Type: 10

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  if peattributes.no_security == false then
    return mp.CLEAN
  end
  local l_0_1 = mp.getfilesize()
  if l_0_1 < 200000 then
    return mp.CLEAN
  end
  if 900000 < l_0_1 then
    return mp.CLEAN
  end
  local l_0_2 = string.lower(mp.getfilename())
  local l_0_3 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  if string.find(l_0_3, "\\appdata\\roaming\\microsoft\\windows\\start menu\\programs\\startup", 1, true) ~= nil and string.find(l_0_2, "\\%d+%.exe$") ~= nil then
    local l_0_4 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
    if #l_0_4 < 12 or 16 < #l_0_4 then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
