-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\276b3d848e52a\0x00000a32_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0.ppid, true) then
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
              else
                if (this_sigattrlog[10]).matched and (this_sigattrlog[10]).utf8p2 ~= nil then
                  l_0_1 = (string.lower)((this_sigattrlog[10]).utf8p2)
                else
                  if (this_sigattrlog[11]).matched and (this_sigattrlog[11]).utf8p2 ~= nil then
                    l_0_1 = (string.lower)((this_sigattrlog[11]).utf8p2)
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
if l_0_1 == nil or #l_0_1 < 4 then
  return mp.CLEAN
end
local l_0_2 = 3848698581
;
(mp.ReportLowfi)(l_0_1, l_0_2)
reportRelatedBmHits()
addRelatedProcess()
return mp.INFECTED

