-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\21bb3146e9824\1.luac 

-- params : ...
-- function num : 0
addRelatedProcess()
reportRelatedBmHits()
local l_0_0 = nil
if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil then
  l_0_0 = (string.lower)((this_sigattrlog[4]).utf8p1)
else
  if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p1 ~= nil then
    l_0_0 = (string.lower)((this_sigattrlog[5]).utf8p1)
  else
    if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p1 ~= nil then
      l_0_0 = (string.lower)((this_sigattrlog[6]).utf8p1)
    else
      if (this_sigattrlog[7]).matched and (this_sigattrlog[7]).utf8p1 ~= nil then
        l_0_0 = (string.lower)((this_sigattrlog[7]).utf8p1)
      else
        if (this_sigattrlog[8]).matched and (this_sigattrlog[8]).utf8p1 ~= nil then
          l_0_0 = (string.lower)((this_sigattrlog[8]).utf8p1)
        else
          if (this_sigattrlog[9]).matched and (this_sigattrlog[9]).utf8p1 ~= nil then
            l_0_0 = (string.lower)((this_sigattrlog[9]).utf8p1)
          else
            if (this_sigattrlog[10]).matched and (this_sigattrlog[10]).utf8p1 ~= nil then
              l_0_0 = (string.lower)((this_sigattrlog[10]).utf8p1)
            else
              if (this_sigattrlog[11]).matched and (this_sigattrlog[11]).utf8p1 ~= nil then
                l_0_0 = (string.lower)((this_sigattrlog[11]).utf8p1)
              end
            end
          end
        end
      end
    end
  end
end
if l_0_0 == nil or #l_0_0 < 2 then
  return mp.CLEAN
end
;
(bm.add_related_string)("file_metadata", l_0_0, bm.RelatedStringBMReport)
return mp.INFECTED

