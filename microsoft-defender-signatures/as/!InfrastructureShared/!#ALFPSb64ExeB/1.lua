-- Threat: !InfrastructureShared
-- Name: !#ALF:PSb64Exe.B
-- Type: 13
-- MpAttributes: BRUTE:Base64MZFile & RPF:TopLevelFile

local l_0_0 = mp.getfilesize()
if l_0_0 < 5000000 then
  mp.readprotection(false)
  local l_0_1 = mp.readfile(0, l_0_0)
  if string.find(string.lower(l_0_1), "io.file]::writeallbytes(", 1, true) then
    local l_0_2 = 1
    for l_0_3 in string.gmatch(l_0_1, "TV[%w+/]+=?=?") do
      local l_0_4
      l_0_4 = MpCommon.Base64Decode(l_0_3)
      if l_0_4 ~= nil and l_0_4 ~= "" then
        mp.vfo_add_buffer(l_0_4, string.format("[PSBase64][%02X]", l_0_2), mp.ADD_VFO_TAKE_ACTION_ON_DAD)
        l_0_2 = l_0_2 + 1
      end
    end
    return mp.INFECTED
  end
else
  mp.set_mpattribute("Lua:Psb64ExeBSize")
end
return mp.CLEAN
