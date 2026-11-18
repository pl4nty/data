-- Threat: !InfrastructureShared
-- Name: 2b2913790535
-- Type: 21
-- Includes: LuaFuncHelper

if mp.get_mpattribute("SCPT:RotObfusChecked") then
  return mp.CLEAN
else
  mp.set_mpattribute("SCPT:RotObfusChecked")
end
local l_0_0 = mp.GetBruteMatchData()
local l_0_1
if l_0_0.is_header then
  l_0_1 = tostring(headerpage)
else
  l_0_1 = tostring(footerpage)
end
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = string.gsub(l_0_1, "%s+", "")
local l_0_3 = {
  ["wscript.shell"] = true,
  ["adodb.stream"] = true,
  ["scripting.filesystemobject"] = true
}
for l_0_4, l_0_5 in string.gmatch(l_0_2, "[Cc][Rr][Ee][Aa][Tt][Ee][Oo][Bb][Jj][Ee][Cc][Tt]%(%w+%([\"'](%w*%.%w*)[\"'],(%d%d?%d?)%)%)") do
  local l_0_6 = tonumber(l_0_5)
  local l_0_7
  if l_0_6 then
    l_0_7 = rot_decrypt(l_0_4, l_0_6)
  else
    l_0_7 = rot_decrypt(l_0_4, 13)
  end
  if l_0_7 and l_0_3[l_0_7:lower()] then
    mp.set_mpattribute("SCPT:RotObfusInfected")
    return mp.INFECTED
  end
end
return mp.CLEAN
