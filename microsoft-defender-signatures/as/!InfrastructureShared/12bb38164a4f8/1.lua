-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\12bb38164a4f8\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil then
  l_0_0 = (this_sigattrlog[1]).utf8p1
else
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil then
    l_0_0 = (this_sigattrlog[2]).utf8p1
  else
    if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 ~= nil then
      l_0_0 = (this_sigattrlog[3]).utf8p1
    else
      if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil then
        l_0_0 = (this_sigattrlog[4]).utf8p1
      else
        if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p1 ~= nil then
          l_0_0 = (this_sigattrlog[5]).utf8p1
        end
      end
    end
  end
end
local l_0_1 = (bm.get_current_process_startup_info)()
AppendToRollingQueue("memPagesMetadata", "PPID", l_0_1.ppid, 60)
AppendToRollingQueue("memPagesMetadata", "sig_matched", l_0_0, 60)
;
(bm.request_SMS)(l_0_1.ppid, "h+")
return mp.INFECTED

