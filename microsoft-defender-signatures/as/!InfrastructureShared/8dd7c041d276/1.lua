-- Threat: !InfrastructureShared
-- Name: 8dd7c041d276
-- Type: 21

local function l_0_0(l_1_0)
  for l_1_1 = 1, #l_1_0 do
    local l_1_2 = l_1_0:byte(l_1_1)
    
    if 194 <= l_1_2 and l_1_2 <= 207 or 208 <= l_1_2 and l_1_2 <= 211 then
      return true
    end
  end
  return false
end

local l_0_1 = mp.GetScannedPPID()
if l_0_1 == "" or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = mp.GetProcessCommandLine(l_0_1)
if not l_0_2 then
  return mp.CLEAN
end
if #l_0_2 < 50 then
  return mp.CLEAN
end
local l_0_3 = mp.GetParentProcInfo()
if l_0_3 == nil or l_0_3.image_path == nil then
  return mp.CLEAN
end
local l_0_4 = string.lower(l_0_3.image_path)
if l_0_4:match("([^\\]+)$") ~= "explorer.exe" then
  return mp.CLEAN
end
if l_0_0(l_0_2) then
  return mp.INFECTED
end
if mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.INFECTED
end
return mp.CLEAN
