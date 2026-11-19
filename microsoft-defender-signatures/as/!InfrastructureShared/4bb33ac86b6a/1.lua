-- Threat: !InfrastructureShared
-- Name: 4bb33ac86b6a
-- Type: 21

local l_0_0 = ""
local l_0_1 = string.lower(bm.get_imagepath())
if this_sigattrlog[1].matched or string.find(l_0_1, "\\avclean.exe", 1, true) then
  return mp.INFECTED
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
end
local l_0_2 = {
  "defender",
  "eset",
  "symantec",
  "avtest",
  "general",
  "dyncheck"
}

local function l_0_3(l_1_0, l_1_1)
  for l_1_2 in ipairs(l_1_0) do
    if string.find(l_1_1, l_1_0[l_1_2], 1, true) then
      return true
    end
  end
  return false
end

if l_0_0 ~= "" and string.find(l_0_0, " -m ", 1, true) and string.find(l_0_0, " -i ", 1, true) and string.find(l_0_0, " -a ", 1, true) and l_0_3(l_0_2, l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
