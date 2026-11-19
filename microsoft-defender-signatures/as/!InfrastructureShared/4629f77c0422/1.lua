-- Threat: !InfrastructureShared
-- Name: 4629f77c0422
-- Type: 21

if not mp.get_mpattribute("BM_SCHEDULEDTASK_JOBFILE") then
  return mp.CLEAN
end
if mp.get_mpattribute("SCRIPT:SuspSchedTask.G") then
  return mp.CLEAN
end
local l_0_0 = tostring(headerpage)
local l_0_1 = l_0_0:match("<Arguments>(.-)</Arguments>")
if l_0_1 == nil then
  return mp.CLEAN
end
mp.set_mpattribute("SCRIPT:SuspSchedTask.G")
l_0_1 = l_0_1:gsub("%^", "")
if string.find(l_0_1, "/c mshta.exe http", 1, true) then
  mp.set_mpattribute("SCRIPT:SuspSchedTask.G2b")
end
local l_0_2, l_0_3 = l_0_1:match("[Pp][Oo][Ww][Ee][Rr][Ss][Hh][Ee][Ll][Ll].-%s[%-/]([eE][nN]?[cC]?[oO]?[dD]?[eE]?[dD]?[cC]?[oO]?[mM]?[mM]?[aA]?[nN]?[dD]?)%s+[\"']?([A-Za-z0-9+/=]+)")
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_5 = l_0_2 and #l_0_3 % 4 == 0 and l_0_3:match("^[A-Za-z0-9+/]+=*$") and not l_0_3:find("=.+[^=]") and not l_0_3:find("===", 1, true)
if l_0_5 then
  local l_0_6 = MpCommon.Base64Decode(l_0_3)
  if l_0_6 then
    l_0_6 = string.gsub(l_0_6, "%z", "")
    l_0_6 = string.lower(l_0_6)
    mp.vfo_add_buffer(l_0_6, "[TaskSchedCommand]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
  end
end
return mp.CLEAN
