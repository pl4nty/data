-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\70b368dfe2e2\0x00000472_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 then
  local l_0_0 = (this_sigattrlog[2]).utf8p2
  l_0_0 = urlDecode(l_0_0)
  local l_0_1 = "?url=(.*)"
  do
    if not (string.match)(l_0_0, l_0_1) then
      local l_0_2 = (string.match)(l_0_0, "(https?://.*)")
    end
    -- DECOMPILER ERROR at PC31: Confused about usage of register: R2 in 'UnsetPending'

    if not l_0_2 then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC37: Confused about usage of register: R2 in 'UnsetPending'

    local l_0_3 = urlDecode(l_0_2)
    do
      local l_0_4, l_0_6, l_0_7 = (string.match)(l_0_3, ".sharepoint.com/:%w:/%w/personal/(.-)/") or (string.match)(l_0_3, ".sharepoint.com/:%w:/%w/sites/(.-)/") or (string.match)(l_0_3, ".sharepoint.com/:%w:/%w/(.-)/") or ""
      do
        local l_0_5, l_0_8 = , ((this_sigattrlog[2]).utf8p1):match("([^\\]+)$") or ""
        local l_0_9 = nil
        local l_0_10 = nil
        do
          local l_0_11 = 1800
          AppendToRollingQueue("TEAMS_Download", "ClickedLink", l_0_10 .. "->" .. l_0_3 .. "->" .. l_0_9, l_0_11, 100, 0)
          return mp.CLEAN
        end
      end
    end
  end
end

