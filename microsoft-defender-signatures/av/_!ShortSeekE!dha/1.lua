-- Threat: \xac!ShortSeek.E!dha
-- Type: 13
-- MpAttributes: BM_LNK_FILE & SCPT:ShortSeek.D

local l_0_0 = {
  [8957006] = true,
  [2262201400] = true
}
local l_0_1 = true
local l_0_2 = sysio.GetLogicalDrivesMask()
local l_0_3 = {
  "A:",
  "B:",
  "C:",
  "D:",
  "E:",
  "F:",
  "G:",
  "H:",
  "I:",
  "J:",
  "K:",
  "L:",
  "M:",
  "N:",
  "O:",
  "P:",
  "Q:",
  "R:",
  "S:",
  "T:",
  "U:",
  "V:",
  "W:",
  "X:",
  "Y:",
  "Z:"
}
for l_0_4, l_0_5 in ipairs(l_0_3) do
  if mp.bitand(mp.shl32(1, l_0_4 - 1), l_0_2) ~= 0 then
    local l_0_6 = sysio.GetFileFsVolumeInformation(l_0_5)
    if l_0_6 ~= nil and l_0_6.VolumeSerialNumber ~= nil and l_0_0[l_0_6.VolumeSerialNumber] then
      l_0_1 = false
    end
  end
end
if l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
