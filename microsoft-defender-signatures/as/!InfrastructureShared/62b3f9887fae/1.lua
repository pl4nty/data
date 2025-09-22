-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\62b3f9887fae\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil and (this_sigattrlog[2]).utf8p2 ~= nil then
  local l_0_0 = (string.lower)((this_sigattrlog[2]).utf8p1)
  local l_0_1 = (string.lower)((this_sigattrlog[2]).utf8p2)
  if (string.find)(l_0_0, "appdata\\local\\temp\\rar$", 1, true) then
    local l_0_2 = (string.match)(l_0_1, "fsize:(%d+)")
    if l_0_2 ~= nil and tonumber(l_0_2) <= 1000000000 and tonumber(l_0_2) >= 500000000 then
      if (this_sigattrlog[1]).utf8p2 ~= nil then
        local l_0_3 = "|.7z|.zip|.rar|"
        local l_0_4 = (string.lower)((this_sigattrlog[1]).utf8p2)
        bm_AddRelatedFileFromCommandLine(l_0_4, l_0_3)
      end
      do
        do
          do return mp.INFECTED end
          return mp.CLEAN
        end
      end
    end
  end
end

