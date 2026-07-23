-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELTrojanLinuxUPXPackedLib\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = 3
local l_0_1 = 62
local l_0_2 = 40
local l_0_3 = 183
local l_0_4 = 1
local l_0_5 = elfhdr.ident
local l_0_6 = (string.byte)(l_0_5, 6)
if l_0_6 ~= l_0_4 or elfhdr.machine ~= l_0_0 and elfhdr.machine ~= l_0_1 and elfhdr.machine ~= l_0_2 and elfhdr.machine ~= l_0_3 then
  return mp.CLEAN
end
local l_0_7 = 2
local l_0_8 = 3
local l_0_9 = false
for l_0_13 = 1, elfhdr.phnum do
  local l_0_14 = ephdrs[l_0_13]
  if l_0_14.type == l_0_8 then
    return mp.CLEAN
  else
    if l_0_14.type == l_0_7 then
      l_0_9 = true
    end
  end
end
if l_0_9 then
  return mp.INFECTED
end
return mp.CLEAN

