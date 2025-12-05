package com.clifford.Mapper;

import com.clifford.DTO.CustomerDTO;
import com.clifford.model.Customer;
import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2025-12-04T17:11:16+0800",
    comments = "version: 1.4.2.Final, compiler: javac, environment: Java 21.0.9 (Red Hat, Inc.)"
)
@Component
public class ICustomerMapperImpl implements ICustomerMapper {

    @Override
    public Customer toCustomer(CustomerDTO customerDTO) {
        if ( customerDTO == null ) {
            return null;
        }

        Customer customer = new Customer();

        customer.setId( customerDTO.getId() );
        customer.setName( customerDTO.getName() );
        customer.setEmail( customerDTO.getEmail() );
        customer.setAge( customerDTO.getAge() );

        return customer;
    }

    @Override
    public CustomerDTO fromCustomer(Customer customer) {
        if ( customer == null ) {
            return null;
        }

        CustomerDTO customerDTO = new CustomerDTO();

        customerDTO.setId( customer.getId() );
        customerDTO.setName( customer.getName() );
        customerDTO.setEmail( customer.getEmail() );
        customerDTO.setAge( customer.getAge() );

        return customerDTO;
    }
}
