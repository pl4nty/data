-- Threat: !InfrastructureShared
-- Name: !#LUA:JS/Glassworm.Z!MTB
-- Type: 13
-- MpAttributes: SCRIPT:StringUTF-8 & SCRIPT:EvalBuffer & BM_TEXT_FILE & RPF:TopLevelFile

local l_0_0 = mp.getfilesize()
if l_0_0 < 15360 or 51200 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = tostring(mp.readfile(0, l_0_0)) or ""
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = {
  "\239\184\128",
  "\239\184\143",
  "\243\160\132",
  "\243\160\133",
  "\226\128\139",
  "\226\128\140",
  "\226\128\141",
  "\226\129\160"
}

local function l_0_3(l_1_0)
  for l_1_1, l_1_2 in ipairs(l_0_2) do
    if l_1_0:find(l_1_2, 1, true) then
      return true
    end
  end
  return false
end

if l_0_3(l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
