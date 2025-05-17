-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\ba784cfe0\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
l_0_0["P\000L\000U\000G\000I\000N\000S\000\000\000"] = "PLUGINS"
l_0_0["P\000L\000U\000G\000I\000N\000S\0006\0004\000\000\000"] = "PLUGINS64"
l_0_0["P\000N\000G\000\000\000"] = "PNG"
l_0_0["A\000F\000X\000_\000D\000I\000A\000L\000O\000G\000_\000L\000A\000Y\000O\000U\000T\000\000\000"] = "AFX_DIALOG_LAYOUT"
l_0_0["U\000P\000X\000\000\000"] = "UPX"
l_0_0["Q\000Q\000W\000R\000Y\000\000\000"] = "QQWRY"
local l_0_1 = 0
local l_0_2 = ((pehdr.DataDirectory)[pe.IMAGE_DIRECTORY_ENTRY_RESOURCE]).RVA
local l_0_3 = ((pehdr.DataDirectory)[pe.IMAGE_DIRECTORY_ENTRY_RESOURCE]).Size
local l_0_4 = l_0_2 + l_0_3
if l_0_2 == 0 then
  return mp.CLEAN
end
if (mp.getfilesize)() < 20398080 then
  return mp.CLEAN
end
local l_0_5 = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = tonumber
  local l_1_4 = (l_1_0:reverse()):gsub
  do
    local l_1_5 = l_1_0:reverse()
    l_1_4 = l_1_4(l_1_5, ".", function(l_2_0)
    -- function num : 0_0_0
    local l_2_1 = string.format
    local l_2_2 = "%02x"
    do
      local l_2_3, l_2_4 = (string.byte)(l_2_0), .end
      do return l_2_1(l_2_2, l_2_3, l_2_4) end
      -- DECOMPILER ERROR at PC9: Confused about usage of register R2 for local variables in 'ReleaseLocals'

    end
  end
)
    local l_1_2 = nil
    l_1_5 = 16
    local l_1_3 = nil
    do return l_1_1(l_1_4, l_1_5) end
    -- DECOMPILER ERROR at PC10: Confused about usage of register R2 for local variables in 'ReleaseLocals'

  end
end

;
(mp.readprotection)(false)
local l_0_6 = l_0_5((mp.readfile)((pe.foffset_rva)(l_0_2 + 12), 2))
if l_0_6 < 16 then
  local l_0_7 = l_0_2 + 16
  while 1 do
    if l_0_6 > 0 then
      local l_0_8 = l_0_5((mp.readfile)((pe.foffset_rva)(l_0_7), 4))
      if (mp.bitand)(l_0_8, 2147483648) == 2147483648 then
        l_0_8 = l_0_2 + (mp.bitand)(l_0_8, 2147483647)
        if l_0_8 < l_0_4 then
          local l_0_9 = l_0_5((mp.readfile)((pe.foffset_rva)(l_0_8), 2))
          if l_0_9 < 20 and l_0_0[(mp.readfile)((pe.foffset_rva)(l_0_8 + 2), l_0_9 * 2) .. "\000\000"] ~= nil then
            l_0_1 = l_0_1 + 1
          end
        end
      end
      do
        do
          l_0_7 = l_0_7 + 8
          l_0_6 = l_0_6 - 1
          -- DECOMPILER ERROR at PC107: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC107: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC107: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end
;
(mp.readprotection)(true)
if l_0_1 >= 5 then
  return mp.INFECTED
end
return mp.CLEAN

