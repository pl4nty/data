-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f6b3e40aaafc\0x0000c1a6_luac 

-- params : ...
-- function num : 0
(bm.DisableSignature)()
local l_0_0, l_0_1 = nil, nil
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
  l_0_0 = (this_sigattrlog[1]).utf8p2
else
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
    l_0_0 = (this_sigattrlog[2]).utf8p2
  else
    if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil then
      l_0_0 = (this_sigattrlog[3]).utf8p2
    else
      if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 ~= nil then
        l_0_0 = (this_sigattrlog[4]).utf8p2
      end
    end
  end
end
if contains(l_0_0, "%-[eE][ncodemaNCODEMA]*%s+\"?%s*([A-Za-z0-9/%+=]+)", false) or contains(l_0_0, "–[eE][ncodemaNCODEMA]*%s+\"?%s*([A-Za-z0-9/%+=]+)", false) then
  l_0_1 = NormalizeCmdline("powershell", l_0_0)
end
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if l_0_0 ~= l_0_1 then
  (bm.trigger_sig)("PShellB64Decode", l_0_1)
end
return mp.CLEAN

