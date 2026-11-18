-- Threat: !InfrastructureShared
-- Name: !#ALF:Backdoor:Win64/Timeheist.G!dha
-- Type: 13
-- MpAttributes: Timeheist.G

local l_0_0 = mp.getfilesize()
if l_0_0 == 3010425 or l_0_0 == 3070329 or l_0_0 == 3227513 or l_0_0 == 3160953 then
  local l_0_1 = mp.readheader(0, 256)
  local l_0_2 = 0
  local l_0_3 = 0
  if string.find(l_0_1, "\000\000", 1, true) then
    return mp.CLEAN
  end
  local l_0_4 = {
    string.byte(l_0_1, 1, -1)
  }
  for l_0_5 = 1, #l_0_4 do
    local l_0_6 = l_0_4[l_0_5]
    if l_0_6 == 0 then
      l_0_2 = l_0_2 + 1
      if 4 < l_0_2 then
        return mp.CLEAN
      end
    elseif 32 <= l_0_6 and l_0_6 <= 127 or 9 <= l_0_6 and l_0_6 <= 13 then
      l_0_3 = l_0_3 + 1
    end
  end
  if 180 < l_0_3 then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
