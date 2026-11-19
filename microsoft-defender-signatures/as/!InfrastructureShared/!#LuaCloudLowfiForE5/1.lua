-- Threat: !InfrastructureShared
-- Name: !#Lua:CloudLowfiForE5
-- Type: 13
-- MpAttributes: Lua:MpEnableCustomE5Signatures & RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN and (mp.bitand(mp.get_contextdata(mp.CONTEXT_DATA_DEVICE_CHARACTERISTICS), 264193) == 264193 or mp.bitand(mp.get_contextdata(mp.CONTEXT_DATA_DEVICE_CHARACTERISTICS), 16) == 16) or mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
  if nil == l_0_0 then
    return mp.CLEAN
  end
  local l_0_1 = {
    [".hta"] = true,
    [".js"] = true,
    [".jse"] = true,
    [".ps1"] = true,
    [".vbs"] = true,
    [".vbe"] = true,
    [".wsh"] = true
  }
  local l_0_2 = l_0_0:sub(-5):match("(%.%w+)$")
  l_0_2 = nil == l_0_2 and "" or l_0_2:lower()
  if true == l_0_1[l_0_2] then
    mp.set_mpattribute("Lua:CloudLowfiForE5!" .. l_0_2:sub(2))
  end
end
return mp.CLEAN
