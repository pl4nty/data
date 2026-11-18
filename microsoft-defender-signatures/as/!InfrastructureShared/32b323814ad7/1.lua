-- Threat: !InfrastructureShared
-- Name: 32b323814ad7
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
  local l_0_1
  if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) then
    l_0_1 = sysio.GetFileSize(l_0_0)
    if l_0_1 ~= nil and l_0_1 < 500 then
      extractRansomNote(l_0_0)
      sms_untrusted_process()
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
