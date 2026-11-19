-- Threat: !InfrastructureShared
-- Name: 11d09e5b5285
-- Type: 21

if not mp.get_mpattribute("BM_SCRIPT_OR_TEXT_FILE") and not mp.get_mpattribute("Nscript:Type_ps") and not mp.get_mpattribute("BM_ScriptFile") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if not l_0_0 then
  return mp.CLEAN
end
if l_0_0 <= 50 or 10485760 <= l_0_0 then
  return mp.CLEAN
end
if l_0_0 < 4 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, 4)
mp.readprotection(true)
if not l_0_1 or #l_0_1 ~= 4 then
  return mp.CLEAN
end
if l_0_1 ~= "\239\187\191$" then
  return mp.CLEAN
end
if l_0_0 < 1203 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_2 = mp.readfile(3, 1200)
mp.readprotection(true)
if not l_0_2 or #l_0_2 ~= 1200 then
  return mp.CLEAN
end
local l_0_3 = 0
local l_0_4 = 0
for l_0_5 in l_0_2:gmatch("[^\r\n]+") do
  local l_0_6 = l_0_5:match("^%s*(.-)%s*$")
  if l_0_6 ~= "" then
    l_0_4 = l_0_4 + 1
    if 6 < l_0_4 then
      break
    end
    local l_0_7 = l_0_6:match("^(%$[A-Za-z]+)%s*=")
    if not l_0_7 then
      break
    end
    local l_0_8 = l_0_7:sub(2)
    local l_0_9 = #l_0_8
    if 12 < l_0_9 and l_0_9 < 800 then
      local l_0_10 = {}
      local l_0_11 = 0
      for l_0_12 = 1, l_0_9 do
        local l_0_13 = l_0_8:sub(l_0_12, l_0_12)
        if not l_0_10[l_0_13] then
          l_0_10[l_0_13] = true
          l_0_11 = l_0_11 + 1
        end
      end
      if l_0_11 <= 2 then
        l_0_3 = l_0_3 + 1
        if 2 <= l_0_3 then
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
