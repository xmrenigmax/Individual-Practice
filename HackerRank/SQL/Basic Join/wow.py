from graphviz import Digraph

def create_dfd():
    dfd = Digraph('DFD', format='png')
    dfd.attr(rankdir='LR', size='10')
    
    # External Entities
    dfd.node('Customer', 'Customer', shape='box')
    dfd.node('Admin', 'Admin', shape='box')
    dfd.node('Accountant', 'Accountant', shape='box')
    dfd.node('Office_Manager', 'Office Manager', shape='box')
    dfd.node('Service_Provider', 'Service Provider', shape='box')
    
    # Processes
    dfd.node('P1', 'Customer Request', shape='ellipse')
    dfd.node('P2', 'Record Request Details', shape='ellipse')
    dfd.node('P3', 'Check Service Provider Availability', shape='ellipse')
    dfd.node('P4', 'Confirm Booking with Customer', shape='ellipse')
    dfd.node('P5', 'Confirm Booking with Service Provider', shape='ellipse')
    dfd.node('P6', 'Generate Invoice', shape='ellipse')
    dfd.node('P7', 'Send Confirmation and Invoice', shape='ellipse')
    dfd.node('P8', 'Update Booking Database', shape='ellipse')
    
    # Data Stores
    dfd.node('D1', 'Customer Database', shape='cylinder')
    dfd.node('D2', 'Service Provider Database', shape='cylinder')
    dfd.node('D3', 'Booking Database', shape='cylinder')
    dfd.node('D4', 'Invoice Database', shape='cylinder')
    
    # Data Flows
    dfd.edge('Customer', 'P1', label='Request Service')
    dfd.edge('P1', 'P2', label='Request Details')
    dfd.edge('P2', 'D1', label='Store Customer Info')
    dfd.edge('P2', 'P3', label='Check Availability')
    dfd.edge('D2', 'P3', label='Service Provider Details')
    dfd.edge('P3', 'P4', label='Availability Confirmation')
    dfd.edge('P4', 'Customer', label='Booking Confirmation')
    dfd.edge('P4', 'P5', label='Confirm with Provider')
    dfd.edge('P5', 'Service_Provider', label='Booking Confirmation')
    dfd.edge('P4', 'P6', label='Generate Invoice')
    dfd.edge('P6', 'D4', label='Store Invoice Details')
    dfd.edge('P6', 'P7', label='Send Invoice')
    dfd.edge('P7', 'Customer', label='Confirmation & Invoice')
    dfd.edge('P7', 'Accountant', label='Invoice Details')
    dfd.edge('P4', 'P8', label='Update Booking')
    dfd.edge('P8', 'D3', label='Store Booking Details')
    
    dfd.save('dfd_booking_system')
    print("DFD saved as dfd_booking_system.gv")

dfd = create_dfd()
