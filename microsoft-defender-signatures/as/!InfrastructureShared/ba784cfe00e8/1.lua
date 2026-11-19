-- Threat: !InfrastructureShared
-- Name: ba784cfe00e8
-- Type: 21
-- Flags: 1

local l_0_0 = {
  ["P\000L\000U\000G\000I\000N\000S\000\000\000"] = "PLUGINS",
  ["P\000L\000U\000G\000I\000N\000S\0006\0004\000\000\000"] = "PLUGINS64",
  ["P\000N\000G\000\000\000"] = "PNG",
  ["A\000F\000X\000_\000D\000I\000A\000L\000O\000G\000_\000L\000A\000Y\000O\000U\000T\000\000\000"] = "AFX_DIALOG_LAYOUT",
  ["U\000P\000X\000\000\000"] = "UPX",
  ["Q\000Q\000W\000R\000Y\000\000\000"] = "QQWRY"
}
local l_0_1 = 0
local l_0_2 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_RESOURCE].RVA
local l_0_3 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_RESOURCE].Size
local l_0_4 = l_0_2 + l_0_3
if l_0_2 == 0 then
  return mp.CLEAN
end
if mp.getfilesize() < 20398080 then
  return mp.CLEAN
end

local function l_0_5(l_1_0)
  return tonumber(l_1_0:reverse():gsub(".", function(l_2_0)
    return string.format("%02x", string.byte(l_2_0))
  end), 16)
end

mp.readprotection(false)
local l_0_6 = l_0_5(mp.readfile(pe.foffset_rva(l_0_2 + 12), 2))
if l_0_6 < 16 then
  local l_0_7 = l_0_2 + 16
  while 0 < l_0_6 do
    local l_0_8 = l_0_5(mp.readfile(pe.foffset_rva(l_0_7), 4))
    if mp.bitand(l_0_8, 2147483648) == 2147483648 then
      l_0_8 = l_0_2 + mp.bitand(l_0_8, 2147483647)
      if l_0_4 > l_0_8 then
        local l_0_9 = l_0_5(mp.readfile(pe.foffset_rva(l_0_8), 2))
        if l_0_9 < 20 then
          local l_0_10 = mp.readfile(pe.foffset_rva(l_0_8 + 2), l_0_9 * 2) .. "\000\000"
          if l_0_0[l_0_10] ~= nil then
            l_0_1 = l_0_1 + 1
          end
        end
      end
    end
    l_0_7 = l_0_7 + 8
    l_0_6 = l_0_6 - 1
  end
end
mp.readprotection(true)
if 5 <= l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
