-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1eab34e1116dc\0x00000946_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if IsExcludedByImagePathMacOS(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = nil
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
  l_0_1 = (string.lower)((this_sigattrlog[2]).utf8p2)
else
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil then
    l_0_1 = (string.lower)((this_sigattrlog[3]).utf8p2)
  else
    if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 ~= nil then
      l_0_1 = (string.lower)((this_sigattrlog[4]).utf8p2)
    else
      if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 ~= nil then
        l_0_1 = (string.lower)((this_sigattrlog[5]).utf8p2)
      else
        if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p2 ~= nil then
          l_0_1 = (string.lower)((this_sigattrlog[6]).utf8p2)
        else
          if (this_sigattrlog[7]).matched and (this_sigattrlog[7]).utf8p2 ~= nil then
            l_0_1 = (string.lower)((this_sigattrlog[7]).utf8p2)
          else
            if (this_sigattrlog[8]).matched and (this_sigattrlog[8]).utf8p2 ~= nil then
              l_0_1 = (string.lower)((this_sigattrlog[8]).utf8p2)
            else
              if (this_sigattrlog[9]).matched and (this_sigattrlog[9]).utf8p2 ~= nil then
                l_0_1 = (string.lower)((this_sigattrlog[9]).utf8p2)
              end
            end
          end
        end
      end
    end
  end
end
if l_0_1 == nil or #l_0_1 < 500 then
  return mp.CLEAN
end
if IsExcludedByCmdlineMacOS(l_0_1) then
  return mp.CLEAN
end
if #l_0_1 >= 500 then
  (bm.trigger_sig)("MacRunningLargeShellContentInCmd_GT500", l_0_1)
end
if #l_0_1 >= 1000 then
  (bm.trigger_sig)("MacRunningLargeShellContentInCmd_GT1000", l_0_1)
end
if #l_0_1 >= 1500 then
  (bm.trigger_sig)("MacRunningLargeShellContentInCmd_GT1500", l_0_1)
end
if #l_0_1 >= 2000 then
  (bm.trigger_sig)("MacRunningLargeShellContentInCmd_GT2000", l_0_1)
end
if #l_0_1 >= 2500 then
  (bm.trigger_sig)("MacRunningLargeShellContentInCmd_GT2500", l_0_1)
end
return mp.INFECTED

