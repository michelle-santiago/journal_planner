document.addEventListener('DOMContentLoaded',  function(){
    console.log("dom loaded")
})
window.addEventListener("load", function(){
    console.log("window loaded")
    sidebar() 
});
document.addEventListener('turbo:render', function(){
    console.log("turbo render")
    sidebar()
})

function sidebar(){
    const sidebar = document.getElementById('sidebar');

    if (sidebar) {
        const toggleSidebarMobile = (sidebar, toggleSidebarMobileHamburger, toggleSidebarMobileClose) => {
            sidebar.classList.toggle('hidden');
            toggleSidebarMobileHamburger.classList.toggle('hidden');
            toggleSidebarMobileClose.classList.toggle('hidden');
        }
        
        const toggleSidebarMobileEl = document.getElementById('toggleSidebarMobile');
        const toggleSidebarMobileHamburger = document.getElementById('toggleSidebarMobileHamburger');
        const toggleSidebarMobileClose = document.getElementById('toggleSidebarMobileClose');
        
        toggleSidebarMobileEl.addEventListener('click', () => {
            toggleSidebarMobile(sidebar, toggleSidebarMobileHamburger, toggleSidebarMobileClose);
        }); 

    }

}
