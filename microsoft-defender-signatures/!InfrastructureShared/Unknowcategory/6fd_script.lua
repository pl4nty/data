-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6fd_luac 

-- params : ...
-- function num : 0
Infrastructure_ScanADFSPath = function()
  -- function num : 0_0
  (MpDetection.ScanResource)("specialfolder://norecursive:file:%Windir%\\ADFS\\")
end


