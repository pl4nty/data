-- Threat: !InfrastructureShared
-- Name: !#Lua:LNK_Settings
-- Type: 12
-- MpAttributes: BM_LNK_FILE

if mp.HEADERPAGE_SZ < 61 then
  return mp.CLEAN
end
local l_0_0 = mp.readu_u16(headerpage, 21)
if l_0_0 ~= nil and l_0_0 ~= 0 then
  if mp.bitand(l_0_0, 4) == 4 then
    mp.set_mpattribute("Lua:LNK_Settings!HasNameComment")
  end
  if mp.bitand(l_0_0, 8) == 8 then
    mp.set_mpattribute("Lua:LNK_Settings!HasRelativePath")
  end
  if mp.bitand(l_0_0, 16) == 16 then
    mp.set_mpattribute("Lua:LNK_Settings!HasWorkingDir")
  end
  if mp.bitand(l_0_0, 32) == 32 then
    mp.set_mpattribute("Lua:LNK_Settings!HasArguments")
  else
    mp.set_mpattribute("Lua:LNK_Settings!HasNoArguments")
  end
  if mp.bitand(l_0_0, 64) == 64 then
    mp.set_mpattribute("Lua:LNK_Settings!HasIconLocation")
  end
  if mp.bitand(l_0_0, 128) == 128 then
    mp.set_mpattribute("Lua:LNK_Settings!IsUnicode")
  end
  if mp.bitand(l_0_0, 16384) == 16384 then
    mp.set_mpattribute("Lua:LNK_Settings!HasExpIcon")
  end
end
local l_0_1 = mp.readu_u16(headerpage, 61)
if l_0_1 ~= nil and l_0_1 ~= 0 then
  if l_0_1 == 1 then
    mp.set_mpattribute("Lua:LNK_Settings!RunNormal")
  elseif l_0_1 == 3 then
    mp.set_mpattribute("Lua:LNK_Settings!RunMaximized")
  elseif l_0_1 == 7 then
    mp.set_mpattribute("Lua:LNK_Settings!RunMinimized")
  end
end
return mp.CLEAN
