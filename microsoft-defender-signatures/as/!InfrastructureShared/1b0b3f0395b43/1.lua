-- Threat: !InfrastructureShared
-- Name: 1b0b3f0395b43
-- Type: 21

local l_0_0
local l_0_1 = bm.get_current_process_startup_info()
if l_0_1.integrity_level < MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
  return mp.CLEAN
end
if this_sigattrlog[3].matched then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
elseif this_sigattrlog[4].matched then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p1)
elseif this_sigattrlog[5].matched then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p1)
end
if l_0_0 ~= nil then
  local l_0_2 = string.sub(l_0_0, -4)
  local l_0_3 = "|.asp|aspx|ashx|asmx|"
  if string.find(l_0_3, l_0_2, 1, true) then
    if sysio.IsFileExists(l_0_0) then
      bm.add_related_file(l_0_0)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
