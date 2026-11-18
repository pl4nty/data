-- Threat: !InfrastructureShared
-- Name: !#ALF:PSb64WriteFile.C
-- Type: 13
-- MpAttributes: SCRIPT:PS.WriteAllBytes & RPF:TopLevelFile & SCPT:PowerShell.FromBase64String

local l_0_0 = mp.getfilesize()
if l_0_0 < 5000000 then
  mp.readprotection(false)
  local l_0_1 = mp.readfile(0, l_0_0)
  local l_0_2, l_0_3, l_0_4
  local l_0_5 = 1
  l_0_2, l_0_3 = string.find(l_0_1, "%:%:FromBase64String%(")
  if l_0_2 ~= nil then
    l_0_2, l_0_3, l_0_4 = string.find(l_0_1, "([%w/+=]+)", l_0_3 + 1)
    if l_0_2 ~= nil then
      local l_0_6
      l_0_6 = MpCommon.Base64Decode(l_0_4)
      if l_0_6 ~= nil and l_0_6 ~= "" then
        mp.vfo_add_buffer(l_0_6, string.format("[PSBase64][%02X]", l_0_5), mp.ADD_VFO_TAKE_ACTION_ON_DAD)
        l_0_5 = l_0_5 + 1
      end
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
