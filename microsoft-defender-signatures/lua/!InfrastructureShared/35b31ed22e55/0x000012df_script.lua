-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\35b31ed22e55\0x000012df_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
  local l_0_0 = (this_sigattrlog[2]).utf8p2
  local l_0_1, l_0_2 = l_0_0:match("^(.-)\\\\(.-)$")
  if l_0_1 == nil or l_0_2 == nil then
    return mp.CLEAN
  end
  local l_0_3 = GetRegistryValue(l_0_1, l_0_2)
  if l_0_3 then
    local l_0_4, l_0_5 = (string.find)(l_0_3, "A\000\000\000\b\000\002\000\000\000\000\000\000\000\000\000", 80, true)
    if l_0_5 then
      l_0_4 = (string.find)(l_0_3, "\f\000\002\000\001", l_0_5, true)
      if not l_0_5 then
        return mp.CLEAN
      end
      if (string.find)(l_0_3, " \136\0034\167\003", l_0_5, true) or (string.find)(l_0_3, "\129\019ʦS\214", l_0_5, true) or (string.find)(l_0_3, "\f\136\027gO\244", l_0_5, true) or (string.find)(l_0_3, "\1720*��=", l_0_5, true) then
        return mp.CLEAN
      end
      if (string.find)(l_0_3, "\\\000m\000s\000m\000p\000e\000n\000g\000.\000e\000x\000e\000", l_0_5, true) or (string.find)(l_0_3, "\\\000m\000s\000s\000e\000n\000s\000e\000.\000e\000x\000e\000", l_0_5, true) or (string.find)(l_0_3, "\\\000s\000e\000n\000s\000e\000i\000r\000.\000e\000x\000e\000", l_0_5, true) or (string.find)(l_0_3, "\\\000s\000e\000n\000s\000e\000n\000d\000r\000.\000e\000x\000e\000", l_0_5, true) or (string.find)(l_0_3, "\\\000s\000e\000n\000s\000e\000c\000n\000c\000p\000r\000o\000x\000y\000.\000e\000x\000e\000", l_0_5, true) or (string.find)(l_0_3, "\\\000s\000e\000n\000s\000e\000s\000a\000m\000p\000l\000e\000u\000p\000l\000o\000a\000d\000e\000r\000.\000e\000x\000e\000", l_0_5, true) then
        return mp.INFECTED
      end
    end
  end
end
do
  return mp.CLEAN
end

