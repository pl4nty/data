-- Threat: \xadChitexa
-- Type: 13
-- MpAttributes: BM_LNK_FILE

local l_0_0 = mp.GetLnkInfo()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = l_0_0.Arguments
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = string.find(l_0_1, "\\RECYCLER.BIN\\", 1, true)
if l_0_2 ~= nil and 1 < l_0_2 then
  local l_0_3 = string.byte(l_0_1, l_0_2 - 1)
  if 128 <= l_0_3 and l_0_3 <= 255 then
    return mp.INFECTED
  end
end
return mp.CLEAN
