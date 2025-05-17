-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\64c_luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
if (this_sigattrlog[4]).matched then
  l_0_0 = (string.lower)((this_sigattrlog[4]).utf8p1)
else
  if (this_sigattrlog[5]).matched then
    l_0_0 = (string.lower)((this_sigattrlog[5]).utf8p1)
  else
    if (this_sigattrlog[6]).matched then
      l_0_0 = (string.lower)((this_sigattrlog[6]).utf8p1)
    else
      if (this_sigattrlog[7]).matched then
        l_0_0 = (string.lower)((this_sigattrlog[7]).utf8p1)
      else
        if (this_sigattrlog[8]).matched then
          l_0_0 = (string.lower)((this_sigattrlog[8]).utf8p2)
        else
          if (this_sigattrlog[9]).matched then
            l_0_0 = (string.lower)((this_sigattrlog[9]).utf8p2)
          else
            if (this_sigattrlog[10]).matched then
              l_0_0 = (string.lower)((this_sigattrlog[10]).utf8p2)
            else
              if (this_sigattrlog[11]).matched then
                l_0_0 = (string.lower)((this_sigattrlog[11]).utf8p2)
              end
            end
          end
        end
      end
    end
  end
end
local l_0_1 = ""
if (this_sigattrlog[12]).matched then
  l_0_1 = (string.lower)((this_sigattrlog[12]).utf8p2)
end
local l_0_2 = ""
if (this_sigattrlog[13]).matched then
  l_0_2 = (string.lower)((this_sigattrlog[13]).utf8p2)
end
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if l_0_1 ~= "" and l_0_1 ~= nil and (string.find)(l_0_1, l_0_0) then
  return mp.INFECTED
end
if l_0_2 ~= "" and l_0_2 ~= nil and (string.find)(l_0_2, l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN

