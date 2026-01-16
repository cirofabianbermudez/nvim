# UVM Notes

## Accellera documentation summary

---

### `uvm_void`

The uvm_void class is the base class for all UVM classes. It is an abstract class with no data members or functions. It allows for generic containers of objects to be created, similar to a void pointer in the C programming language. User classes derived directly from uvm_void inherit none of the UVM functionality, but such classes may be placed in uvm_void-typed containers along with other UVM objects.

**`uvm_void`**

The uvm_void class is the base class for all UVM classes.

#### Class Declaration

```verilog
virtual class uvm_void
```

---

### `uvm_object`

The uvm_object class is the base class for all UVM data and hierarchical classes. Its primary role is to define a set of methods for such common operations as create, copy, compare, print, and record. Classes deriving from `uvm_object` must implement the pure virtual methods such as create and get_type_name.

#### Summary `uvm_object`

The uvm_object class is the base class for all UVM data and hierarchical classes.

#### Class Hierarchy

```plain
uvm_void
uvm_object
```

#### Class Declaration

```verilog
virtual class uvm_object extends uvm_void
```

#### Methods and attibutes

| Name                | Description                                                                                                                                                                                                                                                    |
| ------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `new`               | Creates a new uvm_object with the given instance name.                                                                                                                                                                                                         |
| **Seeding**         |                                                                                                                                                                                                                                                                |
| `use_uvm_seeding`   | This bit enables or disables the UVM seeding mechanism.                                                                                                                                                                                                        |
| `reseed`            | Calls srandom on the object to reseed the object using the UVM seeding mechanism, which sets the seed based on type name and instance name instead of based on instance position in a thread.                                                                  |
| **Identificattion** |                                                                                                                                                                                                                                                                |
| `set_name`          | Sets the instance name of this object, overwriting any previously given name.                                                                                                                                                                                  |
| `get_name`          | Returns the name of the object, as provided by the name argument in the new constructor or set_name method.                                                                                                                                                    |
| `get_full_name`     | Returns the full hierarchical name of this object.                                                                                                                                                                                                             |
| `get_inst_id`       | Returns the object’s unique, numeric instance identifier.                                                                                                                                                                                                      |
| `get_inst_count`    | Returns the current value of the instance counter, which represents the total number of uvm_object-based objects that have been allocated in simulation.                                                                                                       |
| `get_type`          | Returns the type-proxy (wrapper) for this object                                                                                                                                                                                                               |
| `get_object_type`   | Returns the type-proxy (wrapper) for this object.                                                                                                                                                                                                              |
| `get_type_name`     | This function returns the type name of the object, which is typically the type identifier enclosed in quotes.                                                                                                                                                  |
| **Creation**        |                                                                                                                                                                                                                                                                |
| `create`            | The create method allocates a new object of the same type as this object and returns it via a base uvm_object handle.                                                                                                                                          |
| `clone`             | The clone method creates and returns an exact copy of this object.                                                                                                                                                                                             |
| **Printing**        |                                                                                                                                                                                                                                                                |
| `print`             | The print method deep-prints this object’s properties in a format and manner governed by the given printer argument; if the printer argument is not provided, the global uvm_default_printer is used.                                                          |
| `sprint`            | The sprint method works just like the print method, except the output is returned in a string rather than displayed.                                                                                                                                           |
| `do_print`          | The do*print method is the user-definable hook called by print and sprint that allows users to customize what gets printed or sprinted beyond the field information provided by the `uvm_field*\* macros, Utility and Field Macros for Components and Objects. |
| `convert2string`    | This virtual function is a user-definable hook, called directly by the user, that allows users to provide object information in the form of a string.                                                                                                          |
| **Copying**         |                                                                                                                                                                                                                                                                |
| `copy`              | The copy makes this object a copy of the specified object.                                                                                                                                                                                                     |
| `do_copy`           | The do_copy method is the user-definable hook called by the copy method.                                                                                                                                                                                       |
| **Comparing**       |                                                                                                                                                                                                                                                                |
| `compare`           | Deep compares members of this data object with those of the object provided in the rhs (right-hand side)                                                                                                                                                       |
| `do_compare`        | The do_compare method is the user-definable hook called by the compare method.                                                                                                                                                                                 |
|                     |                                                                                                                                                                                                                                                                |

---

### `uvm_report_object`

The uvm_report_object provides an interface to the UVM reporting facility. Through this interface, components issue the various messages that occur during simulation. Users can configure what actions are taken and what file(s) are output for individual messages from a particular component or for all messages from all components in the environment. Defaults are applied where there is no explicit configuration.

Most methods in uvm_report_object are delegated to an internal instance of a uvm_report_handler, which stores the reporting configuration and determines whether an issued message should be displayed based on that configuration. Then, to display a message, the report handler delegates the actual formatting and production of messages to a central uvm_report_server.

A report consists of an id string, severity, verbosity level, and the textual message itself. They may optionally include the filename and line number from which the message came. If the verbosity level of a report is greater than the configured maximum verbosity level of its report object, it is ignored. If a report passes the verbosity filter in effect, the report’s action is determined. If the action includes output to a file, the configured file descriptor(s) are determined.

#### Summary `uvm_report_object`

The uvm_report_object provides an interface to the UVM reporting facility.

#### Class Hierarchy

```plain
uvm_void
uvm_object
uvm_report_object
```

#### Class Declaration

```verilog
class uvm_report_object extends uvm_object
```

#### Methods and attibutes

| Name                    | Description                                                                                                      |
| ----------------------- | ---------------------------------------------------------------------------------------------------------------- |
| `new`                   | Creates a new uvm_object with the given instance name.                                                           |
| **Reporting**           |                                                                                                                  |
| `uvm_get_report_object` | Returns the nearest uvm_report_object when called.                                                               |
| `uvm_report_enabled`    | Returns 1 if the configured verbosity for this severity/id is greater than or equal to verbosity else returns 0. |
| `uvm_report`            |                                                                                                                  |
| `uvm_report_info`       |                                                                                                                  |
| `uvm_report_warning`    |                                                                                                                  |
| `uvm_report_error`      |                                                                                                                  |
| `uvm_report_fatal`      | These are the primary reporting methods in the UVM.                                                              |
|                         |                                                                                                                  |

---

### `uvm_component`

The uvm_component class is the root base class for UVM components. In addition to the features inherited from uvm_object and uvm_report_object, uvm_component provides the following interfaces:

|                       |                                                                                                                                                                                                       |
| --------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Hierarchy             | provides methods for searching and traversing the component hierarchy.                                                                                                                                |
| Phasing               | defines a phased test flow that all components follow, with a group of standard phase methods and an API for custom phases and multiple independent phasing domains to mirror DUT behavior e.g. power |
| Transaction recording | provides a convenience interface to the uvm_report_handler. All messages, warnings, and errors are processed through this interface.                                                                  |
| Factory               | provides a convenience interface to the uvm_factory. The factory is used to create new components and other objects based on type-wide and instance-specific configuration.                           |

#### Summary `uvm_component`

The uvm_component class is the root base class for UVM components.

#### Class Hierarchy

```plain
uvm_void
uvm_object
uvm_report_object
uvm_component
```

#### Class Declaration

```verilog
virtual class uvm_component extends uvm_report_object
```

#### Methods and attibutes

| Name                        | Description                                                                                                                                                                                                                                              |
| --------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `new`                       | Creates a new component with the given leaf instance name and handle to its parent.                                                                                                                                                                      |
| **Hierarchy Interface**     | These methods provide user access to information about the component hierarchy, i.e., topology.                                                                                                                                                          |
| `get_parent`                | Returns a handle to this component’s parent, or null if it has no parent.                                                                                                                                                                                |
| `get_full_name`             | Returns the full hierarchical name of this object.                                                                                                                                                                                                       |
| `get_childen`               | This function populates the end of the children array with the list of this component’s children.                                                                                                                                                        |
| `get_child`                 |                                                                                                                                                                                                                                                          |
| `get_next_child`            |                                                                                                                                                                                                                                                          |
| `get_first_child`           | hese methods are used to iterate through this component’s children, if any.                                                                                                                                                                              |
| `get_num_children`          | Returns the number of this component’s children.                                                                                                                                                                                                         |
| `has_child`                 | Returns 1 if this component has a child with the given name, 0 otherwise.                                                                                                                                                                                |
| `lookup`                    | Looks for a component with the given hierarchical name relative to this component.                                                                                                                                                                       |
| `get_depth`                 | Returns the component’s depth from the root level.                                                                                                                                                                                                       |
| **Phasing Interface**       | These methods implement an interface which allows all components to step through a standard schedule of phases, or a customized schedule, and also an API to allow independent phase domains which can jump like state machines to reflect behavior e.g. |
| `build_phase`               |                                                                                                                                                                                                                                                          |
| `connect_phase`             |                                                                                                                                                                                                                                                          |
| `end_of_elaboration_phase`  |                                                                                                                                                                                                                                                          |
| `start_of_simulation_phase` |                                                                                                                                                                                                                                                          |
| `run_phase`                 |                                                                                                                                                                                                                                                          |
| `pre_reset_phase`           |                                                                                                                                                                                                                                                          |
| `reset_phase`               |                                                                                                                                                                                                                                                          |
| `post_reset_phase`          |                                                                                                                                                                                                                                                          |
| `pre_configure_phase`       |                                                                                                                                                                                                                                                          |
| `configure_phase`           |                                                                                                                                                                                                                                                          |
| `post_configure_phase`      |                                                                                                                                                                                                                                                          |
| `pre_main_phase`            |                                                                                                                                                                                                                                                          |
| `main_phase`                |                                                                                                                                                                                                                                                          |
| `post_main_phase`           |                                                                                                                                                                                                                                                          |
| `pre_shutdown_phase`        |                                                                                                                                                                                                                                                          |
| `shutdown_phase`            |                                                                                                                                                                                                                                                          |
| `post_shutdown_phase`       |                                                                                                                                                                                                                                                          |
| `extract_phase`             |                                                                                                                                                                                                                                                          |
| `check_phase`               |                                                                                                                                                                                                                                                          |
| `report_phase`              |                                                                                                                                                                                                                                                          |
| `final_phase`               |                                                                                                                                                                                                                                                          |
|                             |                                                                                                                                                                                                                                                          |

---

## General

- Agents are configurable for reuse across test/projects
- `run` phases executes concurrently with the scheduled Run-Time phases
- UVM tests are derived from `uvm_test` class
- Execution of UVM test is done via global task `run_test()`
- Use phase objection mechanism to stay in phase and execute content of methods
- Compile with `-ntb_opts uvm-1.2` switch
- Specify test to run with `+UVM_TESTNAME` switch
- Macro registers the class in factory `uvm_factory::get()`
  ```systemverilog
  class test_base extends uvm_test;
      `uvm_component_utils(test_base)
  endclass
  ```
- UVM package contains a `uvm_root` singleton `uvm_root::get()`
  ```systemverilog
  import uvm_pkg::*;
  ```
- `run_test()` causes `uvm_root` singleton to retrieve the test name from `+UVM_TESTNAME=test_base` and create a test component called `uvm_test_top` which is the parent of all UVM test components
  ```systemverilog
  initial begin
    run_test();
  end
  ```
- Then, the `uvm_root` singleton executes the pase methods of components

## Report Messages

- Print messages with UVM Macros
  ```systemverilog
  `uvm_info(string ID, string MSG, verbosity)
  `uvm_fatal(string ID, string MSG)
  `uvm_error(string ID, string MSG)
  `uvm_warning(string ID, string MSG)
  ```
- The verbosity can be `UVM_MEDIUM`, `UVM_LOW`, `UVM_HIGH`, `UVM_FULL`, `UVM_NONE`
- Verbosity filters default to `UVM_MEDIUM`
  - User can modify run-time filter via `+UVM_VERBOSITY=UVM_HIGH` switch
- Topology of the test can be printed with
  - `uvm_root::get().print_topology();`
- Control filtering of block of code
  - Based on `uvm_report` mechanism
    ```systemverilog
    if (uvm_report_enabled(UVM_HIGH, UVM_INFO, "ID")) begin
      uvm_root::get().print_topology();
    end
    ```

## UVM Test

- UVM test class is the top component of test structure

  - Extends from the `uvm_test` base class
  - Creates environment object

    ```systemverilog
    class test_base extends uvm_test;

      `uvm_component_utils(test_base)

      function new(string name, uvm_component parent);
        super.new(name, parent);
      endfunction

      router_env env;
      virtual function void build_phase();
        super.build_phase(phase);
        env = router_env::type_id::create("env", this);
      endfunction

    endclass
    ```

  - Then, develop targeted tests extending from `test_base`

## UVM Envoronment

- Encapsulates DUT specific Verification Components

  - Encapsulate agents, scoreboards and coverage

    ```systemverilog
    class router_env extends uvm_env;

      `uvm_component_utils(router_env)

      function new(string name, uvm_component parent);
        super.new(name, parent);
      endfunction

      input_agent i_agt;

      virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        i_agt = input_agent::type_id::create("i_agt", this);
      endfunction

    endclass
    ```

## UVM Agent

- Encapsulates sequencer, driver and monitor

  ```systemverilog
  class input_agent extends uvm_agent;

    `uvm_component_utils(input_agent)

    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction

    typedef uvm_sequencer #(packet) packet_sequencer;
    packet_sequencer sqr;
    driver drv;

    virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      sqr = packet_sequencer::type_id::create("sqr", this);
      drv = driver::type_id::create("drv", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
      dvr.seq_item_port.connect(sqr.seq_item_export);
    endfunction

  endclass
  ```

## UVM Driver

- Driver class extend from `uvm_driver` class

  - `uvm_driver` class has a built-in TLM port

    ```systemverilog
    class driver extends uvm_driver;

      `uvm_component_utils(uvm_driver)

      function new(string name, uvm_component parent);
        super.new(name, parent);
      endfunction

      virtual task void run_phase(uvm_phase phase);
        forever begin
          seq_item_port.get_next_item(req);
          `uvm_info("DRV_RUN", req.sprint(), UVM_MEDIUM);
          seq_item_port.item_done();
        end
      endfunction

    endclass
    ```

  - Driver implements `run_phase` as an infinite loop to process all sequence items received from sequencer
  - `item_done()` in the TLM port must be called before retrieving next item

## UVM Transaction

- Derived from `uvm_sequence_item` base class
  - Built-in support for stimulus creation, printing, comparing, etc.
- Properties should be public by default
  - Must be visible to constraints in others classes
- Properties should be rand by default

  - Can be turned off with `rand_mod()`

  ```systemverilog
  class packet extends uvm_sequence_item;
      `uvm_object_utils(packet)
      rand bit [3:0]  sa, da;
      rand bit [15:0] len;
      rand bit [7:0]  payload[$];
      rand bit [31:0] crc;

      function new(string name = "packet");
          super.new(name);
          this.crc.rand_mode(0);
      endfunction

      constraint packet_valid {
          len > 0;
      }

      constraint packet_ieee {
        len inside {46:1500};
      }
  endclass
  ```

- Define constraint block for the must-obey constraints
  - Never turned off
  - Never overridden
  - Name `class_name_valid`
- Define constraint block for should-obey constraints
  - Can be turned off to inject errors
  - One block per relationship set
    - Can be individually turned off or overloaded
    - Name `class_name_rule`
- Can't accidentally violate valid constraints
  - Constraint solver will fail if the user constraints conflict with valid constraints
- Transaction processing methods are not virtual with the exception of `clone()`
  - `print()`, `sprint()`, `copy()`, `compare()`, `pack()`, `unpack()`, `record()`
- User must NOT override these methods
- The non-virtual methods calls two virtual methods
- The fist way to processing fields of the transaction class is through user implementation of the following `do_` methods
  - `do_print()`, `do_copy()`, `do_compare()`, `do_pack()`, `do_unpack()`, `do_record()`
- The alternative way of processing the transaction fields is through the `` `uvm_field `` macros
  - The following actions are supported via the macro:
    - print, copy, compare, record, pack (enabled by `UVM_ALL_ON` flag)
      ```systemverilog
      `uvm_object_utils_begin(packet)
          `uvm_field_int(sa, UVM_ALL_ON | UVM_NOCOMPARE)
          `uvm_field_int(da, UVM_ALL_ON)
      `uvm_object_utils_end
      ```
    - Scalar and array properties are supported
      - `` `uvm_field_object() ``, `` `uvm_field_string()``, and more
    - For object recursion, default is `UVM_DEEP`
      - Copy nested object
    - Can be changed to `UVM_REFERENCE`
      - Copy object handle
    - Additional FLAGS can be used to set radix for print methods
      - `UVM_BIN`, `UVN_DEC`, `UVM_UNSIGNED`, `UVM_HEX`, `UVM_STRING`, `UVM_REAL`, and more
- Modify constraint in transaction
  - By Type
    - Create a `packet_da_3` extended from `packet`
    - Create a`test_da_3_type` extended from `test_base` and override using
      ```systemverilog
      virtual function void build_phase();
          super.build_phase(phase);
          set_type_override_by_type( packet::get_type(), packet_da_3::get_type() );
      endfunction
      ```
    - Simulate with `./simv +UVM_TESTNAME=test_da_3_type`
    - Or directly from the command line in the simv command
      ```bash
        +uvm_set_type_override=packet,my_packet
      ```
  - By Instance
    - Create a `packet_da_3` extended from `packet`
    - Create a`test_da_3_inst` extended from `test_base` and override using
    ```systemverilog
    virtual function void build_phase();
        super.build_phase(phase);
        set_inst_override_by_type( "env.i_agt.sqr*", packet::get_type(), packet_da_3::get_type() );
    endfunction
    ```
    - Simulate with `./simv +UVM_TESTNAME=test_da_3_inst`
    - Or directly from the command line in the simv command
      ```bash
        +uvm_set_inst_override=packet,my_packet,*.agt.*
      ```

## UVM Sequence

- The stimulus generator in UVM is called a sequence
- User sequences must be extended from `uvm_sequence` class

  - Parameterized to the transaction type to be generated
  - Two handles are available (built in):

    - `req` for request to driver
    - `rsp` for response back from driver

    ```systemverilog
    class packet_sequence extends uvm_sequence #(packet);
      `uvm_object_utils(packet_sequence)

      function new(string name);
        super.new(name);
      endfunction

      virtual task body();
        `uvm_do(req);
      endtask

    endclass
    ```

- Sequence functional code resided in `body()` task
  - `` `uvm_do() `` creates, randomizes and passes transaction to driver through sequencer
  - `` `uvm_do_with() `` is the same as `` `uvm_do() `` but with addition al constraints
  - Optional `get_response()` retrieves response from driver through sequencer
  - User can manually execute the methods that the `` `uvm_do() `` macro implements:
    ```systemverilog
    virtual task body();
        `uvm_create(req);
        start_item(req);
        req.randomize();
        finish_item(req);
    endtask
    ```
- Sequences are executed in task phases
- Sequence executes when its `start()` method is called
- The `start()` method calls the `body()` method
- There are two ways to execute a sequence
  - Explicitly
    - Test writer must create the sequence object then call the `start()` method
      ```systemverilog
      virtual task main_phase(uvm_phase phase);
          packet_sequence seq;
          phase.raise_objection(this);
          seq = packet_sequence::type_id::create("seq", this);
          if ( !seq.randomize() ) begin
              `uvm_fatal();
          end
          seq.set_starting_phase(phase);
          seq.start(env.agt.sqr);
          phase.drop_objection(this);
      endtask
      ```
    - Only do this in test
    - Must implement the phase method
    - Must raise and drop phase objection in phase method
    - Must call sequence's `start()` method and specify a sequencer
  - Implicitly
    - Test writer populates the `uvm_config_db` with the intended sequence execution
      - Can be done in test code or via run-time switch
    - The sequencer will pick it up from the `uvm_config_db`, create the sequence object and call the `start()` method automatically
      ```systemverilog
      virtual function void build_phase(uvm_phase phase);
          uvm_config_db #(uvm_object_wrapper)::set(this, "env.agt.sqr.main_phase", "default_sequence", packet_sequence::get_type() );
      endfunction
      ```
    - Populate `uvm_config_db` with sequence to be executed by the chosen sequencer in phase specified
      - Set in `build_phase`
      - Can be done in environment class or test class
      - Can be overridden in higher layer structure, derived class or run-time switch
    - Can be mixed with explicit execution
      - Implicit sequence must manage objections
    - Implicit sequence execution automatically happens in the configured phase
      - Retrieves `default_sequence` from `uvm_config_db`
      - Constructs `seq` object
      - Sets sequence's `starting_phase`
      - Randomizes sequence
      - Calls sequence's `start()` method
    - In implicit sequence execution, no phase objections are raised or dropped in test
    - The sequence must manage objection
    - Derived test can be used to override or turn off sequences if the last argument is set to `null`
    - Sequences can be targeted for a chosen phase
      - `"env.agt.sqr.reset_phase"` or `"env.agt.sqr.configure_phase"` or `"env.agt.sqr.main_phase"`
    - Sequence phase objection for UVM-1.2
      ```systemverilog
      set_automatic_phase_objection(1);
      ```

## UVM Configuration and Factory

- UVM behavioral base class is `uvm_component`
  - Has logical parent-child relationship
  - Used for phasing control, configuration and factory override
- Logical relationship is established at creation of component object
- Rich set of methods for query and display
  ```systemverilog
  agt.print();
  string str = drv.get_name();
  string str - drv.get_full_name();
  uvm_component comp;
  comp = uvm_root::get().find("*.sqr");
  uvm_component comp[$];
  comp = uvm_root::get().find_all("*.drv?", comps);
  foreach (comps[i]) begin
    comps[i].print();
  end
  ```
- Easy to get handle to object parent/children
  ```systemverilog
  uvm_component comp;
  comp = this.get_parent();
  uvm_component comp;
  comp = vip.get_child("sqr");
  int num_ch = vip.get_num_children();
  string name;
  uvm_component child;
  if (vip.get_first_child(name)) begin
    do begin
    child = vip.get_child(name);
    child.print();
    end while (vip.get_next_child(name));
  end
  ```
- Two mechanism for defining component configurations
  - `uvm_config_db`
  - `uvm_resource_db`
- `uvm_config_db` is build on top of `uvm_resource_db`
  - Some overlap in capability
- `uvm_config_db` is structured for hierarchical configs
  - Focused on component instances
  - Can also be used globally
- During `build_phase`
  - `uvm_config_db` parent wins for multiple writes
- After `build_phase` last one wins
- Mechanism for configuring object properties

  - `uvm_config_db#(type)::set(context, inst_name, field, value)`
  - `uvm_config_db#(type)::get(context, inst_name, field, var)`
  - Context is usually `this`
  - Examples

    ```systemverilog
    // Set from the environment
    master_agent_config agt_cfg;
    uvm_config_db#(master_agent_config)::set(this, "mst_agt", "cfg", agt_cfg);

    // Set from the program/module. Context of "null" or "uvm_root::get()"
    master_iterface mst_intf;
    uvm_config_db#(virtual master_interface.TB)::set(null, "uvm_test_top.env.mst_agt", "vif", mst_intf.TB);

    // Set global for test bench from the env
    uvm_config_db#(int)::set(this, "*", "enable_coverage", 0);

    // Set from the environment
    uvm_config_db#(int)::get(this, "", "count", mon_count);

    // Set from the program/module. Context of "null" or "uvm_root::get()"
    master_interface vif;
    uvm_config_db#(virtual master_interface.TB)::get(this, "", "vif", vif);
    ```

  ```

  ```

- Agent component field configuration

  - Environment should target agent

    - Agent then configures its child components

      ```systemverilog
      class router_env extends uvm_env;
        virtual function void build_phase(uvm_phase phase);
          super.build_phase(phase);
          uvm_config_db#(int)::set(this, "i_agt[10]", "port_id", 10);
        endfunction
      endclass

      class agent extends uvm_agent;
        int port_id = -1;
        `uvm_component_utils_begin(agent)
          `uvm_field_int(port_id, UVM_ALL)
        `uvm_component_utils_end
        virtual function void build_phase(uvm_phase phase);
          super.build_phase(phase);
          uvm_config_db#(int)::get(this, "", "port_id", port_id); // No need of hierarchical reference since we are the agent
          uvm_config_db#(int)::set(this, "*", "port_id", port_id); // Anything below it
        endfunction
      endclass
      ```

- In driver/monitor

  - Call `uvm_config_db#()::get()` in `build_phase`
  - Check for correctness in `end_of_elaboration_phase`

    ```systemverilog
    class driver extends uvm_driver#(packet);
      virtual router_io vif;
      virtual function void build_phase(uvm_phase);
        super.build_phase(phase);
        uvm_config_db#(virtual router_io)::get(this, "", "vif", vif);
      endfunction

      virtual function void end_of_elaboration_phase(uvm_phase);
        super.end_of_elaboration_phase(phase);
        if (vif == null) begin
          `uvm_fatal("CFGERR", "Driver GUT interface not set");
        end
      endfunction
    endclass
    ```

- In agent

  - In `build_phase`

    - Call `uvm_config_db#():get()` to retrieve interface
    - Call `uvm_config_db#():set()` to set interface fo children of agent
      ```systemverilog
      class input_agent extends uvm_agent;
        virtual router_io vif;
        virtual function void build_phase(uvm_phase phase);
          super.build_phase(phase);
          uvm_config_db#(virtual router_io)::get(this, "", "vif", vif); // No need of hierarchical reference since we are the agent
          uvm_config_db#(virtual router_io)::set(this, "*", "vif", vif); // Anything below it
        endfunction
      endclass
      ```

    ```

    ```

- Manage test variations
  - Tests need to introduce class variations
    - Adding constraints
    - Modify the way data is sent by the driver
  - Variations can be instance based or global
  - Control object construction for all or specific instances of a class
  - Create generic functionality
    - Deferring exact object creation to runtime
- Solution: Built-in UVM Factory
- Implementation Flow
  - Factory instrumentation/registration
    - `` `uvm_object_utils(Type) ``
    - `` `uvm_component_utils(Type) ``
    - Macro creates a proxy class (called `type_id`) to represent the object/component and registers an instance of the proxy class in `uvm_factory`
  - Construct object using static proxy class method
    - `ClassName obj = ClassName::type_id::create()`
    - Use proxy class to create object
  - Class overrides
    - `set_type_override_by_type()`
    - `set_inst_override_by_type()`
    - Created objects con now be overridden with a new implementation
- Factory transactions

  - How to manufacture transaction instances with additional information without modifying the original source file?

    - Construct transaction object via `create()` method
    - Required, macro defines a proxy class called `type_id`. An instance of proxy class is registered in `uvm_factory`
    - Use proxy's `create()` method to construct transaction object.

      ```systemverilog
      class packet extends uvm_sequence_item;
        rand bit[3:0] sa, da;
        `uvm_object_utils_begin(packet)
          `uvm_field_int(sa, UVM_ALL_ON)
        `uvm_object_utils_end
      endclass

      class monitor extends uvm_monitor;
        task run_phase(uvm_phase phase);
          forever begin
            packet pkt;
            pkt = packet::type_id::create("pkt");
          end
        endtask
      endclass
      ```

- Factory components

  - Construct object via `create()` using factory class

    ```systemverilog
    class driver extends uvm_driver #(packet);
        `uvm_component_utils(driver)
        ...
    endclass

      class router_env extends uvm_env;
        `uvm_component_utils(router_env)
        driver drv;
        ...
        function void build_phase(uvm_phase phase);
          super.build_phase(phase);
          drv = driver::type_id::create("drv", this)
        endfunction
      endclass
    ```

- Factory override
  - User can choose type of override
    - `set_inst_override_by_type()`
    - `set_type_override_by_type()`
  - User can override factory objects at command line
    - Objects must be constructed with the factory `class_name::type_id::create()` method
      - `+uvm_set_type_override=<req_type>,<override_type>`
      - `+uvm_set_inst_override=<req_type>,<override_type>,<inst_path>`
  - Works like the test class overrides
    - `set_type_override()`
    - `set_inst_override()`
    - Example
      - `+uvm_set_type_override=driver,newDriver`
      - `+uvm_set_inst_override=packet,bad_packet,uvm_test_top.env.agt.sqr.seq`
  - You should always check the overrides with
    - `uvm_factory::get().print()`
  - Instance overrides are under Instance Overrides
  - Global type overrides are under Type Overrides
  - Put this called in the `start_of_simulation_phase`
  - You can also check the structural overrides with
    - `uvm_root:get().print_topology()`
- Parameterized Component Class
  - Parameterized component requires a different macro
    - `uvm_component_param_utils(cname)`
      ```systemverilog
      class my_driver #(width=8) extend uvm_driver #(packet);
        typedef my_driver #(width) this_type;
        `uvm_component_param_utils(this_type)
        const static string type_name = $sformatf("my_driver#(%0d)", width);
        virtual function string get_type_name();
          return type_name;
        endfunction
      endclass
      ```
    - Creation of object requires parameter
      ```systemverilog
      class my_agent extends uvm_agent;
        typedef my_driver#() my_driver_t;
        my_driver_t drv;
        function void build_phase(uvm_phase phase);
          super.build_phase(phase);
          drv = my_driver_t::type_id::create("drv", this);
        endfunction
      endclass
      ```
- UVM Component communication
  - Transaction exchanged between verification environment components
    - Sequencer -> Driver
    - Monitor -> Collectors (Scoreboard, Coverage)
  - Component can embed method for communication
  ```systemverilog
    class Consumer extends uvm_component;
      virtual task put(transaction tr);
    endclass
  ```
  - But, the communication method should not be called through the component object's handle
    - Code becomes too inflexible for testbench structure
  - Use an intermediary object (TLM) to handle the communication
  - Call communication method through an intermediary object, a TLM port
  - The producer will call into the port and the port will call the consumer.
  - Through the intermediary object (TLM), components can be re-connected to any other component on a testcase by testcase basis
  - In UVM yo have multiple variations of these ports
    - `uvm_*_ports`
    - `uvm_*_export`
    - `uvm_*_imp`
    - `uvm_*_fifo`
    - `uvm_*_socket` (to comunicate to C code)
    - Square is a port
    - Export is a circle
  - UVM TLM 1.0
    - You have
      - One-to-one port
      - One-to-Many
      - Many-to-One
  - Square and diamond ports calls the method
  - Circle ports implements the method
  - Push, Pull, Fifo, Analysis (Broadcast)
    - Push, put_producer calls `port.put()` -> [port] -> put_consumers implements `put()`
    - Pull, get_producer implements `get()` -> [port] -> get_consumer calls `port.get()`

# Rules

1. Import the UVM classes with `import uvm_pkg::*;`.
2. To Start UVM execution, you must start the UVM execution manager by calling the `run_test()` method in an initial block.

3. Select the test using the `run_test(test_name)` method or with the switch `+UVM_TESTNAME=test_name` in the compilation tool.

4. The top test object is called `uvm_test_top`. It is the root parent of all your UVM test components.

5. Every UVM class that you create must be registered into this UVM factory using utility macros.

   ```systemverilog
   `uvm_component_utils()
   `uvm_object_utils()
   ```

   The purpose of the UVM factory is to enable an object of one type to be substituted with an object of a derived type without changing the testbench structure or even the testbench code. The mechanism used is referred to as an override, by either instance or type.

6. The UVM factory requires that you define the constructor.

   For components:

   ```systemverilog
   function new(string name = "my_component", uvm_component parent = null);
     super.new(name, parent);
   endfunction
   ```

   For objects:

   ```systemverilog
   function new(string name = "my_item");
     super.new(name);
   endfunction
   ```

7. To connect the driver to the interface you should use a virtual interface. In order to pass the virtual interface reference into the class you have to use the UVM configuration database.

   In `tb.sv`

   ```systemverilog
   uvm_config_db #(virtual dut_if)::set(null, "*", "vif", dut_vif);
   ```

   In `driver.sv`

   ```systemverilog
   virtual function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     if ( !uvm_config_db #(virtual dut_if)::get(this, "", "vif", vif) ) begin
       `uvm_error("", "Unable to retrieve virtual interface from config db")
     end
   endfunction
   ```

8. The communication between the sequencer and the driver is transaction level TLM, port and export.
9. There are four step that the sequence have to do to generate a transaction:
   1. Create the transaction
   2. Call `start_item(req)`
   3. Randomize the transaction
   4. Call `finish_item(req)`
10. Using the connect phase inside the agent you have to connect the driver and the sequencer.
    ```systemverilog
    function void connect_phase(uvm_phase phase);
      main_driver.seq_item_port.connect( main_sequencer.seq_item_export );
    endfunction
    ```

## Most important elements of `uvm_pkg`

- UVM execution manager singleton object `uvm_root::get()`
- UVM execution factory `uvm_factory::get()`
- UVM configuration database `uvm_config_db`

## Messages

```systemverilog
`uvm_info(string id, string message, int verbosity)
`uvm_warning(string id, string message)
`uvm_error(string id, string message)
`uvm_fatal(string id, string message
```

This are the six levels of verbosity:

```systemverilog
UVM_NOME
UVM_LOW
UVM_MEDIUM
UVM_HIGH
UVM_FULL
UVM_DEGUG
```

You can select the verbosity from the command line with

```bash
+UVM_VERBOSITY=verbosity
```

The `%m` or `%M` is a scape sequence for format specification that display hierarchical name.

- `` `uvm_info("TRACE", "$sformatf("%m")", UVM_HIGH)``

Print the topology

```systemverilog
uvm_root::get().print_topology();
```

Print the Factory Configuration

```systemverilog
uvm_factory::get().print();
```

The constructor arguments allow access to useful name functions, this is part of `` `uvm_object ``:

```systemverilog
function string get_name();
function string get_full_name();
function string get_inst_id();
function string get_type();
function string get_object_type();
function string get_type_name();

```

## UVM Sequence macros

| Macros                         | Description                                                                                                                |
| ------------------------------ | -------------------------------------------------------------------------------------------------------------------------- |
| `` `uvm_do(seq) ``             | On calling this macro, create, randomize and send to the driver will be executed                                           |
| `` `uvm_do_with(seq, const) `` | It is the same as `uvm_do but additionally, constraints can be defined while randomizing                                   |
| `` `uvm_create(seq) ``         | This creates a sequence or item                                                                                            |
| `` `uvm_send(seq) ``           | It directly sends seq/item without creating and randomizing it. So, make sure the seq/item is created and randomized first |
| `` `uvm_rand_seq(seq) ``       | It directly sends a randomized seq/item without creating it. So, make sure the seq/item is created first                   |

## UVM Utility macros

The `utils` macro is used primarily to register an object or component with the factory and is required for it to function correctly.

## UVM Field macros

Are called this way because they operate on class properties and provide automatic implementations of core methods like copy, compare, pack, record and print. This macros should be inside

```systemverilog
`uvm_object_utils_begin(<class_name>)
  `uvm_field_int(<field_name>, <flags>)
  ...
`uvm_object_utils_end
```

Non-array types use these macros:

```systemverilog
`uvm_field_int( <field_name>, <flags> ) // integral types
`uvm_field_object( <field_name>, <flags> ) // class handles
`uvm_field_string( <field_name>, <flags> ) // strings
`uvm_field_event( <field_name>, <flags> ) // events
`uvm_field_real( <field_name), <flags> ) // reals
`uvm_field_enum( <enum_type>, <field_name>, <flags>) // enums
```

```systemverilog
function void do_copy(uvm_object rhs);
function bit do_compare(uvm_object rhs, uvm_comparer comparer);
function string convert2string();
function void do_print(uvm_printer printer);
function void do_record(uvm_recorder recorder);
function void do_pack();
function void do_unpack();
```

Flags are numeric and can be combined using a bitwise OR `|` or AND `&` operator.

| Operation Flag                 | Description                                                 |
| ------------------------------ | ----------------------------------------------------------- |
| `UVM_ALL_ON` and `UVM_DEFAULT` | All field operations enabled                                |
| `UVM_NOCOPY`                   | Excludes the field for copy and clone.                      |
| `UVM_NOCOMPARE`                | Excludes the field for compare.                             |
| `UVM_NOPRINT`                  | Excludes the field in print and sprint.                     |
| `UVM_NOPACK`                   | Excludes the field in pack and unpack.                      |
| `UVM_NORECORD`                 | Excludes the field in vendor-specific transaction recording |

| Radix Flag     | Description                  |
| -------------- | ---------------------------- |
| `UVM_BIN`      | binary format `%b`           |
| `UVM_DEC`      | decimal format `%d`          |
| `UVM_HEX`      | hexadecimal format `%h`      |
| `UVM_OCT`      | format `%o`                  |
| `UVM_UNSIGNED` | unsigned decimal format `%u` |
| `UVM_STRING`   | string format `%s`           |
| `UVM_TIME`     | time format `%t`             |

## Glossary

- Transition Level Modeling (TLM)
- Right hand side (rhs)

## Register & Memories

Every DUT has them

First to be verified

- Reset value
- Bit(s) behavior

High maintenance

- Modify tests
- Modify fimware model

## Testbench without UVM Register Abstraction

## UVM Register Abstraction

Abstracts reading/writing to configuration fields and memories

Supports both front door and back door access

Built in callbacks for read/write

Mirrors register data

Built-in functional coverage

Hierarchical model for ease or reuse

Pre-defined tests exercise registers and memories

## Generating RAL code

UVM RAL code can be created automatically using ralgen and

- RALF file format (Synopsys)
- IPXACT file format (industry standard)

Supports

- Coverage
- Backdoor access
  - DPI
  - XMR
  - Virtual interfaces
- Constraints
- User code

Many companies have their own flow

Implementing RAL: 6 Easy Steps!

## Implement UVM Register Abstraction

Step 1: Verify frontdoor without UVM register abstraction
Step 2: Describe register fields in `.ralf file`, `ip-xact`
Step 3: Use ralgen to create UVM register abstraction
Step 4: Create UVM register abstraction adapter
Step 5: Add UVM register abstraction and adapter in environment
Step 6: Write and run UVM register abstraction sequences
Optional: Implement mirror predictor
Optional: Run built-in test

## Example Specification

## Step 1: Create Host Data & Driver

```verilog
class host_data extends uvm_sequence_item;
  // constructor and utils macro not shown
  rand uvm_qaccess_e kind;
  uvm_status_e       status;
  rand bit[15:0]     addr, data;
endclass
```

Transaction specifies operation, address, data and status

```verilog
class host_driver extends uvm_driver #(host_data);
  // constructor and utils macro not shown
  task run_phase(uvm_phase phase)
    forever begin
       seq_item_port.get_next_item(req);
       data_rw(req);            // call device driver
       seq_item_port.item_done();
    end
  endtask
  // device drivers not shown
endclass
```

Implement host sequence

```verilog
class host_bfm_sequence extends uvm_sequence #(host_data);
  // utils macro, constructor, pre/post_start not shown
  task body();
    `uvm_do_with(req, {addr=='h000;            kind==UVM_READ} );
    `uvm_do_with(req, {addr=='h100;  data=='1; kind==UVM_WRITE});
    `uvm_do_with(req, {addr=='h1025;           kind==UVM_READ} );
  endtask
endclass
```

Sequence hardcodes register addresses. Access DUT through front door

Hardent

## Structure of a Register Model

Implemented with six building block classes

| Name           | Code            |
| -------------- | --------------- |
| Register field | `uvm_reg_field` |
| Register       | `uvm_reg`       |
| Register file  | `uvm_reg_file`  |
| Memory         | `uvm_mem`       |
| Register map   | `uvm_map`       |
| Register block | `uvm_reg_block` |

Register model are created by scripts


The register field models a collection of bits that are associated with a function within a register.

A field will have a width and a bit offset position within the register. A field can have different access modes such as read/write, read only or write/only.

A register contains one or more fields.

A register block corresponds to a hardware block and contains one or more registers. A register block also contains one or more register maps.

A memory region in the design is modeled by a `uvm_mem` which has a range, or size, and is contained within a register block and has a offset determined by a register map.


## Adapter

Inherit from abstract base class `uvm_reg_adapter`

Override two methods

- `reg2bus()`

  - Convert generic RM transaction items to bus sequence items

- `bus2reg()`
  - Convert but sequence items to generic RM transaction items

RM -> Register Model

```verilog
pure virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
pure virtual function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
```

`uvm_reg_bus_op`

| Type                | Field     | Description                                                  |
| ------------------- | --------- | ------------------------------------------------------------ |
| `uvm_reg_addr_t`    | `addr`    | Address field, defaults to 64 bits                           |
| `uvm_reg_data_t`    | `data`    | Read or write data, defaults to 65 bits                      |
| `uvm_access_e`      | `kind`    | `UVM_READ`, `UVM_WRITE`, `UVM_BURST_WRITE`, `UVM_BURST_READ` |
| `unsigned int`      | `n_bits`  | Number of bits being transferred                             |
| `uvm_reg_byte_en_t` | `byte_en` | Byte enable                                                  |
| `uvm_status_e`      | `status`  | `UVM_IS_OK`, `UVM_HAS_X`, `UVM_NOT_OK`                       |


The UVM register model is design to facilitate productive verification of programmable hardware. When used effectively, it raises the level of stimulus abstraction and makes the resultant stimulus code straight-forward to reuse, wither when there is a change in the DUT register address map, or when the BUT block is reused as a sub-component.

There are different register viewpoints:

- The VIP developer
- The Register Model writer
- The Testbench Integrator
- The Testbench User

Verification Intellectual Property (VIP)



Register Fields

The bottom layer is the field which corresponds to one or more bits within a register. Each field definition is an instantiation of the `uvm_reg_field` class. Fields are contained within an `uvm_reg` class and they are constructed and then configured using the `configure()` method:


# Easier UVM Doulos

## Installation

Easier UVM from Doulos is a Perl script code generator for UVM. It is very easy to use and the advantage of using it is that you get a complete and functional UVM environment that works out of the box.

## Input files

- `dut` directory with all your `.sv` files of your design.
- `include` directory for extra codes.
- `common.tpl` file for general configurations
- `arith.tpl` file for the UVM component configurations
- `pinlist` file to map the virtual interface

## Example for a simple adder

`dut/adder.sv`

```verilog
module adder (
  input  logic [7:0] A,B,
  output logic [8:0] F
);

  always_comb begin
    F = A + B;
  end

endmodule
```

`common.tpl`

```
dut_top = adder
top_default_seq_count = 10
```

`arith.tpl`

```
agent_name = arith
trans_item = trans

trans_var = rand logic [7:0] input1;
trans_var = rand logic [7:0] input2;
trans_var =      logic [8:0] sum;

if_port =  logic [7:0] A;
if_port =  logic [7:0] B;
if_port =  logic [8:0] F;

driver_inc  = arith_driver_inc.sv   inline
monitor_inc = arith_monitor_inc.sv  inline
```

`pinlist`

```
!arith_if
A A
B B
F F
```

`arith_driver_inc.sv`

```verilog
task arith_driver::do_drive();
  vif.A <= req.input1;
  vif.B <= req.input2;
  #10;
endtask
```

`arith_monitor_inc.sv`

```verilog
task arith_monitor::do_mon();
  forever @(vif.F) begin
    m_trans.input1 = vif.A;
    m_trans.input2 = vif.B;
    m_trans.sum    = vif.F;
    analysis_port.write(m_trans);
    `uvm_info(get_type_name(), $sformatf("%0d + %0d = %0d", vif.A, vif.B, vif.F), UVM_MEDIUM)
  end
endtask
```

Finally This is how you run the script:

```bash
perl easier_uvm_gel.pl arith.tpl
```

The output is a `generated_tb` directory with all the code and a `easier_uvm_gen.log`




## Register model exmaple using ATMEL 8831 SPI and PeakRDL-uvmm

https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-8331-8-and-16-bit-AVR-Microcontroller-XMEGA-AU_Manual.pdf

Page 273


https://accellera.org/images/downloads/standards/systemrdl/SystemRDL_2.0_Jan2018.pdf

You need to know the SystemRDL language







## Personal notes

`uvm_top` is the same as `uvm_root::get()`

```plain
uvm_root::get().print_topology();
uvm_top.print_topology();
```

The UVM agent configuration object can be instantiated using the factory
using the `create()` or using the `new()` method, the advantage or using
the factory is that you have the possibility of overriding the object


