enum Layout {
  basicWithProfile,
  basicWithProfileAndBrand,
  profileEmphasys,
  brandEmphasys
}

Layout getLayoutByIndex(int index) {
  return Layout.values[index];
}