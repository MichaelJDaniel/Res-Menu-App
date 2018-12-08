import React from 'react'
import Menu from './Menu'

const MenuList = ({ menus }) => (
  <>
    {menus.map(menu =>
      <Menu
        key={menu.id}
        menuName={menu.name}
        {...menu}
      />

    )}




  </>

)



export default MenuList